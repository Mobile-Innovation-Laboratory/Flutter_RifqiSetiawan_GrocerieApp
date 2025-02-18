import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';

class TextRouteAuth extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onPressed;
  TextRouteAuth({super.key, required this.title, required this.onPressed, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: " ${subTitle}",
              style: TextStyle(
                  color: Color(0xff53B175), fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
