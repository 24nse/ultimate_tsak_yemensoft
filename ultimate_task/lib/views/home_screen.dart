

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  final List<Map<String, String>> newOrders = [
    {
      'status': 'Delivering',
      'price': '6378 LE',
      'date': '11/6/2020',
      'color': '0xFF014F56'
    },
  ];

  final List<Map<String, String>> otherOrders = [
    {
      'status': 'Returned',
      'price': '400 LE',
      'date': '1/1/2020',
      'color': '0xFFD93D3D'
    },
    {
      'status': 'Delivered',
      'price': '6378 LE',
      'date': '11/6/2020',
      'color': '0xFF707070'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 110,
                color: const Color(0xFFD93D3D),
              ),
              Positioned(
                right: -60,
                top: -60,
                child: Container(
                  width: 200,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 41, 50, 63),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 40,
                child: const Icon(Icons.language, color: Colors.white),
              ),
              Positioned(
                left: 20,
                top: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Ahmed", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Othman", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                right: 70,
                child: Image.asset(
                  'assets/delivery.png',
                  height: 80,
                ),
              )
            ],
          ),

          Padding(
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
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedTab == 0 ? const Color(0xFF014F56) : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'New',
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
                      onTap: () => setState(() => selectedTab = 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedTab == 1 ? const Color(0xFF014F56) : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Others',
                          style: TextStyle(
                            color: selectedTab == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Orders list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: selectedTab == 0 ? newOrders.length : otherOrders.length,
              itemBuilder: (context, index) {
                final order = selectedTab == 0 ? newOrders[index] : otherOrders[index];
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
                              const Text("#1569999"),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Status\n${order['status']}", style: TextStyle(color: Color(int.parse(order['color']!)), fontWeight: FontWeight.bold)),
                                  Text("Total price\n${order['price']}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text("Date\n${order['date']}", style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          color: Color(int.parse(order['color']!)),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            'Order\nDetails',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


