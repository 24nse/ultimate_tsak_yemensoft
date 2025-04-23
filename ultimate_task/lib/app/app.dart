import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_task/lang/translations.dart';
import 'package:ultimate_task/routes/app_pages.dart';

class MyApp extends StatelessWidget {
    final String locale;

  const MyApp({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return   GetMaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Onyx Delivery',

         translations: AppTranslations(),
      locale: Locale(locale),
      fallbackLocale: const Locale('en'),
    
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
