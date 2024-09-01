import 'package:flutter/material.dart';
import 'package:wijungle/Core/ColorPallete.dart';
import 'package:wijungle/Core/ScreenSize.dart';

class DrawerColumn extends StatelessWidget {
  const DrawerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenSize.height * 0.02,
        ),
        Container(
          color: Colors.transparent,
          height: ScreenSize.height * 0.09,
          width: ScreenSize.width * 0.15,
          child: Image.asset(
            "assets/images/logo2.png",
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.05,
        ),
        Container(
          height: ScreenSize.height * 0.08,
          width: ScreenSize.width * 0.18,
          decoration: BoxDecoration(
            color: Colorpallete.ScaffoldBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Vector.png"),
              SizedBox(
                width: ScreenSize.width * 0.02,
              ),
              Text(
                "Analytics",
                style: TextStyle(
                    fontSize: ScreenSize.width * 0.015,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.65,
        ),
        Container(
          height: ScreenSize.height * 0.08,
          width: ScreenSize.width * 0.18,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/message.png"),
              SizedBox(
                width: ScreenSize.width * 0.02,
              ),
              Text(
                "Feedback",
                style: TextStyle(
                    fontSize: ScreenSize.width * 0.015,
                    fontWeight: FontWeight.w500,
                    color: Colorpallete.ScaffoldBg),
              )
            ],
          ),
        ),
      ],
    );
  }
}
