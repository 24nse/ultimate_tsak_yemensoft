import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_task/viewmodels/home_controller.dart';
import 'package:ultimate_task/widgets/home/custom_widget_appbar.dart';
import 'package:ultimate_task/widgets/home/orders.dart';
import 'package:ultimate_task/widgets/home/tabbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      body: Column(
        children: [

          // Appbar
          customWidgetAppbar(),

        // Tabbar
          Tabbar(controller: controller),
           
          // Orders
          Orders(controller: controller),
        ],
      ),
    );
  }
}
