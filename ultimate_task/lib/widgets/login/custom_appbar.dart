
  import 'package:flutter/material.dart';
import 'package:ultimate_task/utils/helper/dialog_helper.dart';

Widget customAppbar() {
    return Stack(
      children: [
        Container(
          height: 110,
          color:  Colors.transparent,
        ),
        Positioned(
          right: -60,
          top: -60,
          child: Container(
            width: 200,
            height: 180,
            decoration:  BoxDecoration(
              color:  Colors.red,
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
          child: Image.asset(
            'assets/ONYX.png', 
                                    height: 80,
      
          ),
        ),
       
      ],
    );
  }





