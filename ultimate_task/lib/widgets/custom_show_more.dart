
  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customShowMore() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 30),
        child: Text(
          "Show More",
          style: TextStyle(
            color: Colors.teal[900],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }