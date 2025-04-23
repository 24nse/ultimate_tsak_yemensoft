



import 'package:dio/dio.dart';

import 'package:get/get_core/src/get_main.dart';
import '../models/login_request.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Response> login(LoginRequest request) async {
    return await _dio.post('CheckDeliveryLogin', data: request.toJson());
  }




}
