import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_task/viewmodels/login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.userIdController,
              decoration: InputDecoration(labelText: 'رقم المستخدم'),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: controller.login,
                    child: Text('تسجيل الدخول'),
                  )),
          ],
        ),
      ),
    );
  }
}
