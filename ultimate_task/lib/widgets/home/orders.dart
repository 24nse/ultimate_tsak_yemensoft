

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ultimate_task/viewmodels/home_controller.dart';

class Orders extends StatelessWidget {
  const Orders({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final selectedTab = controller.selectedTab.value;
        final bills = selectedTab == 0
            ? controller.bills.where((e) => e.status == 0).toList()
            :controller.bills.where((e) => e.status == 1 ||e.status ==  2 || e.status == 3).toList();
    
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
    
        if (bills.isEmpty) {
          return const Center(child: Text('no_orders_yet'));
        }
    
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bills.length,
          itemBuilder: (context, index) {
            final bill = bills[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("#${bill.billNo}"),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
    Text(
      "Status\n${bill.status == 0 ? 'new'.tr : bill.status == 1 ? 'delivered'.tr : bill.status == 2 ? 'returned'.tr : 'delivering'.tr}",
      style: TextStyle(
        color: bill.status == 0
            ? Colors.green
            : bill.status == 1
      ? Colors.grey
      : bill.status == 2
          ? Colors.red
          : Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
                              Text("Total price\n${bill.billAmt.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text("Date\n${bill.billDate}", style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                      color: bill.status == 0
            ? Colors.green 
            : bill.status == 1
      ? const Color(0xFF707070) 
      : bill.status == 2
          ? const Color(0xFFD93D3D) 
          : const Color(0xFF014F56), 
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const RotatedBox(
                      quarterTurns: 0,
                      child: Text(
                        'Order \nDetails',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
