
  import 'package:flutter/material.dart';

Widget cutomAppbar() {
    return Stack(
           children: [
             Container(
               height: 130,
               color:  Colors.transparent
             ),
               Image.asset(
                       'assets/ONYX.png', 
                
                       height: 120,
                     ),
             Positioned(
               right: -80,
               top: -80,
               child: Container(
                 width: 200,
                 height: 180,
                 decoration: const BoxDecoration(
                   color:  Colors.red,
                   shape: BoxShape.circle,
                 ),
               ),
             ),
             Positioned(
               right: 20,
               top: 20,
               child: const Icon(Icons.language, color: Colors.white),
             ),
     
       
        
           ],
         );
  }



