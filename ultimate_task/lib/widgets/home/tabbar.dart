
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ultimate_task/viewmodels/home_controller.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
            )
          ],
        ),
        child: Obx(() {
          final selectedTab = controller.selectedTab.value;
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectedTab.value = 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedTab == 0 ? const Color.fromARGB(255, 50, 56, 80): Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'new'.tr,
                      style: TextStyle(
                        color: selectedTab == 0 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectedTab.value = 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedTab == 1 ? const Color.fromARGB(255, 50, 56, 80) : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'others'.tr,
                      style: TextStyle(
                        color: selectedTab == 1 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

