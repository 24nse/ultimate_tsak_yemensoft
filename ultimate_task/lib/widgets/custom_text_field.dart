import 'package:flutter/material.dart';

Widget customTextField({
  required String hint,
  bool isPassword = false,
  required TextEditingController controller,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Color(0xFFF1F4F8),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(fontSize: 16, color: Colors.black87),
    ),
  );
}
