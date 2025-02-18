import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldAuth extends StatelessWidget {
  final title;
  final bool isPassword;
  final TextEditingController controller;
  final IconButton? icon;
  TextFieldAuth(
      {super.key,
      required this.title,
      required this.isPassword,
      required this.controller,
      this. icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xff7C7C7C),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: icon,
            focusedBorder: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 0.5, 
              ),
            ),
          ),
          
        ),
      ],
    );
  }
}
