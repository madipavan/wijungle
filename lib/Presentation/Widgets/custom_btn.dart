import 'package:flutter/material.dart';
import 'package:wijungle/Core/ScreenSize.dart';

class CustomBtn extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color bgcolor;
  final VoidCallback onPressed;
  const CustomBtn(
      {super.key,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.bgcolor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: bgcolor,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: ScreenSize.width * 0.015, color: Colors.white),
            )));
  }
}
