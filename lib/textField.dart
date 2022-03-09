import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String placeholder;
  const AppTextField({ required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF1E1C24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: const Color(0xFF5D5D67),
              width: 1
          )
      ),
      child: TextField(
        style: const TextStyle(
            fontSize: 15, color: Colors.white
        ),
        decoration: InputDecoration(hintText: placeholder,
            hintStyle: const TextStyle(
                color: Color(0xFF8F8F9E), fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'
            ),
            border: InputBorder.none

        ),
      ),
    );
  }
}
