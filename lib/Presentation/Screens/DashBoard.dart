import 'package:flutter/material.dart';
import 'package:wijungle/Core/ColorPallete.dart';
import 'package:wijungle/Core/ScreenSize.dart';
import 'package:wijungle/Presentation/Widgets/drawer_column.dart';
import 'package:wijungle/Presentation/Widgets/homedrawer_column.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Colorpallete.ScaffoldBg,
      body: Row(
        children: [
          Container(
            height: ScreenSize.height,
            width: ScreenSize.width / 4.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colorpallete.darkblue,
                Colorpallete.lightblue,
              ]),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50)),
            ),
            child:
                const DrawerColumn(), //custom widget returns column for gradient blue container
          ),
          SizedBox(
            width: ScreenSize.width * 0.7775,
            child: const HomedrawerColumn(), //custom widget returns column
          ),
        ],
      ),
    );
  }
}
