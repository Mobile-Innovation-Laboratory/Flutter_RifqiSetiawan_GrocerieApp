import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonAddMinus extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isAdd; 
  ButtonAddMinus({super.key, this.onTap, required this.isAdd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.transparent,
          border: Border.all(
            color: Color(0xffE2E2E2),
            width: 2,
          )
        ),
        child: Center(
          child: Icon(
            isAdd ? 
            Icons.add : Icons.remove,
            size: 30,
            color: isAdd ? Color(0xff53B175):Color(0xffB3B3B3),
          ),
        ),
      ),
    );
  }
}
