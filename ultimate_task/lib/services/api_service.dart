



import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ultimate_task/models/delivery_bill_model.dart';

import '../models/login_request.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/',
      headers: {'Content-Type': 'application/json'},
    ),
  );


// Login methode
  Future<Response> login(LoginRequest request) async {
    return await _dio.post('CheckDeliveryLogin', data: request.toJson());
  }

//Get  Bills Method
   Future<List<DeliveryBill>> getDeliveryBillsItems(String deliveryNo) async {
    final data = {
      "Value": {
        "P_DLVRY_NO": deliveryNo,
        "P_LANG_NO": "1",
        "P_BILL_SRL": "",
        "P_PRCSSD_FLG": ""
      }
    };

    try {
      final response = await _dio.post('GetDeliveryBillsItems', data: data);

      if (response.statusCode == 200) {
        final result = response.data;
        print("📦 Response from API: $result");

        final deliveryBills = result['Data']?['DeliveryBills'];
        print(deliveryBills);

        if (deliveryBills == null) {
          Get.snackbar("خطأ", "الرد لا يحتوي على DeliveryBills");
          return [];
        }

        return deliveryBills.map<DeliveryBill>((e) => DeliveryBill.fromJson(e)).toList();
      } else {
        Get.snackbar("فشل الاتصال", "رمز الحالة: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      Get.snackbar("حدث خطأ", e.toString());
      return [];
    }
  }




}
