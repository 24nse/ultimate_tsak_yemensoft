
  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget customShowMore() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 30),
        child: Text(
          "show_more".tr,
          style: TextStyle(
            color: Colors.teal[900],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }