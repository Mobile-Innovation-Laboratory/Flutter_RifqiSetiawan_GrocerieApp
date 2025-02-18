import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final title;
  final VoidCallback? onPressed;

  Button({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff53B175),
                      borderRadius: BorderRadius.circular(18)
                    ),
                    width: 350,
                    height: 60,
                    child: Center(
                      child: Text(title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                  ),
                );
  }
}