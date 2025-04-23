
  import 'package:flutter/material.dart';
import 'package:ultimate_task/utils/helper/dialog_helper.dart';

Widget customWidgetAppbar() {
    return Stack(
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
              color:  Color.fromARGB(255, 50, 56, 80),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 40,
          child: InkWell(
            onTap: () =>DialogHelper.showLanguageDialog(),
            child: Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              height: 30,
              width: 30,
              child: const Icon(Icons.language, color: Colors.black)),
          ),
        ),
        Positioned(
          left: 20,
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("nooh", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              Text("saeed", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
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
    );
  }

