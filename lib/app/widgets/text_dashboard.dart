import 'package:flutter/material.dart';

class TextDashboard extends StatelessWidget {
  final String text;
  const TextDashboard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "See all",
          style: TextStyle(
            color: Color(0xff53B175),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
