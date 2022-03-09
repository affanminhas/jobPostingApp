import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  @override
  State<EmailField> createState() => _EmailFieldState();
}
class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF1E1C24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF5D5D67), width: 1)),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
            hintText: "Enter your email address",
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            hintStyle: TextStyle(
                color: Color(0xFF8F8F9E),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins'),
            border: InputBorder.none),
      ),
    );
  }
}
