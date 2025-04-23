import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_task/viewmodels/login_controller.dart';
import 'package:ultimate_task/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      Image.asset(
                        'assets/ONYX.png', 
                 
                        height: 120,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 10),
        
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
        
            
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  "Show More",
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        
            SizedBox(height: 10),
        
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
                      child: Text('Login',style: TextStyle(color: Colors.white),),
                    ),
                )),
       
        
            SizedBox(height: 10),
        
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