import 'package:flutter/material.dart';

class CustomIconbtn extends StatelessWidget {
  final Icon icon;
  final dynamic onPressed;
  const CustomIconbtn({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      color: Colors.black,
      style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
