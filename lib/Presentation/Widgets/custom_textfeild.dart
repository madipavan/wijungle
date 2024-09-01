import 'package:flutter/material.dart';
import 'package:wijungle/Core/ColorPallete.dart';
import 'package:wijungle/Core/ScreenSize.dart';

class CustomTextfeild extends StatelessWidget {
  final double height;
  final double width;
  final String hint;
  final bool obscureText;
  final IconButton? sufix;
  final ValueChanged onChanged;
  final validator;
  CustomTextfeild(
      {super.key,
      required this.height,
      required this.width,
      required this.validator,
      required this.onChanged,
      this.sufix,
      this.obscureText = false,
      required this.hint});

  final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colorpallete.bordergrey));
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          obscureText: obscureText,
          validator: validator,
          cursorColor: Colorpallete.grey,
          cursorHeight: ScreenSize.width * 0.015,
          decoration: InputDecoration(
            suffixIcon: sufix,
            errorBorder: border,
            focusedErrorBorder: border,
            enabledBorder: border,
            focusedBorder: border,
            hintText: hint,
            contentPadding: EdgeInsets.all(ScreenSize.width * 0.01),
            hintStyle: TextStyle(
                color: Colorpallete.grey, fontSize: ScreenSize.width * 0.01),
          ),
        ));
  }
}
