import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_task/routes/app_pages.dart';
import '../models/login_request.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  final GetStorage _storage = GetStorage();

  var isLoading = false.obs;

  void login() async {
    final userId = userIdController.text.trim();
    final password = passwordController.text.trim();

    if (userId.isEmpty || password.isEmpty) {
      Get.snackbar('Error', '   Error: Please fill in all fields');
      return;
    }

    isLoading.value = true;

    try {
      final request = LoginRequest(
        pLangNo: '1',
        pDlvrNo: userId,
        pPsswrd: password,
      );

      final response = await _apiService.login(request);

      if (response.statusCode == 200) {
       

        final data = response.data;
           

  _storage.write('userId', userId);
  _storage.write('password', password);
  Get.offAllNamed(AppRoutes.home);


      } else {
        Get.snackbar('Error', 'An error occurred while connecting to the server');
      }
    } catch (e) {
      Get.snackbar('Error', ' error occurred: $e');
   
    } finally {
      isLoading.value = false;
    }
  }
}
