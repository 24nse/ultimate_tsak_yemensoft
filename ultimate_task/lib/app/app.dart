import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_task/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return   GetMaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Onyx Delivery',
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
