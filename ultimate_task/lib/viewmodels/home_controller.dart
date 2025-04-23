
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_task/services/api_service.dart';
import '../models/delivery_bill_model.dart';
import '../services/db_service.dart';

class HomeController extends GetxController {
  final ApiService _api = ApiService();
  final DBService _db = DBService();
var selectedTab = 0.obs;
  var bills = <DeliveryBill>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBills();
  }

  void fetchBills() async {
    try {
      isLoading.value = true;
      String? userId = GetStorage().read('userId');
    
      final apiData = await _api.getDeliveryBillsItems(userId!);

      if (apiData.isNotEmpty) {
        await _db.insertBills(apiData);
        bills.assignAll(apiData);
        Get.snackbar('Saved ','The invoices have been uploaded and saved successfully!' );
      } else {
        Get.snackbar('no data ','The invoices are not downloaded from server' );
      }
    } catch (e) {
      Get.snackbar('Error','Failed while saving ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  


  
  void filterByStatus(int status) async {
    final filtered = await _db.filterByStatus(status);
    bills.assignAll(filtered);
  }
}

