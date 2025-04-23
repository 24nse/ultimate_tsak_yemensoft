import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_task/utils/helper/dialog_helper.dart';
import 'package:ultimate_task/viewmodels/login_controller.dart';
import 'package:ultimate_task/views/language_selection_page.dart';
import 'package:ultimate_task/widgets/custom_text_field.dart';
import 'package:ultimate_task/widgets/custom_show_more.dart';
import 'package:ultimate_task/widgets/home/custom_widget_appbar.dart';
import 'package:ultimate_task/widgets/login/custom_appbar.dart';

class LoginScreen extends StatelessWidget {
  
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
        
          customAppbar(),
       
            SizedBox(height: 10),

        //Title
            Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Log back into your account",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
        
            SizedBox(height: 20),
        
            // User ID
            customTextField(hint: 'User ID', controller:   controller.userIdController,),
        
            // Password
            customTextField(hint: 'Password', isPassword: true,controller: controller.passwordController ),
        
            SizedBox(height: 10),
        
            // Show More
            customShowMore(),
        
            SizedBox(height: 10),
        

        // Button Login
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : Container(
                    width: 300,
              height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 20, 56, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),),
                      onPressed: controller.login,
                      child: Text('login'.tr,style: TextStyle(color: Colors.white),),
                    ),
                )),
       
        
            SizedBox(height: 10),
        // Image 
            Image.asset(
              'assets/delivery.png', 
              height: 150,
            ),
          ],
        ),
      ),
    );
  }


  
  }

