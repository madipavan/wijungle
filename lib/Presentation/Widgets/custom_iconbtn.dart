import 'package:flutter/material.dart';
import 'package:wijungle/Core/ScreenSize.dart';

class CustomIconbtn extends StatelessWidget {
  final Icon icon;
  final dynamic onPressed;
  const CustomIconbtn({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return IconButton.outlined(
      color: Colors.black,
      style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
      onPressed: onPressed,
      icon: icon,
      iconSize: ScreenSize.width * 0.015,
    );
  }
}
