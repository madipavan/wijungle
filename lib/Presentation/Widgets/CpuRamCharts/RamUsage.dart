import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wijungle/Core/ScreenSize.dart';
import 'package:wijungle/Network/CpuRamUsage.dart';

class Ramusage extends StatefulWidget {
  const Ramusage({super.key});

  @override
  State<Ramusage> createState() => _RamusageState();
}

class _RamusageState extends State<Ramusage> {
  String ramdata = "";
  double RAMpercent = 0;
  double indicatorval = 0;
  @override
  void initState() {
    setState(() {
      _getdata();
    });

    super.initState();
  }

  _getdata() async {
    ramdata = await Cpuramusage().getRAMusage(); // data in string

    setState(() {
      RAMpercent = double.parse(ramdata);
      indicatorval = RAMpercent.round() /
          100; //dividing with 100 because it takes val from 0.1 to 1
    });
    Future.delayed(const Duration(seconds: 1), () => _getdata());
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return CircularPercentIndicator(
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${RAMpercent.round()}%",
            style: TextStyle(
                fontSize: ScreenSize.width * 0.02, fontWeight: FontWeight.bold),
          ),
          Text(
            "RAM",
            style: TextStyle(
                fontSize: ScreenSize.width * 0.02, fontWeight: FontWeight.bold),
          )
        ],
      ),
      radius: ScreenSize.width * 0.08,
      lineWidth: ScreenSize.width * 0.015,
      circularStrokeCap: CircularStrokeCap.round,
      percent:
          indicatorval, //dividing with 100 because it takes val from 0.1 to 1
      progressColor: const Color(0xff147AD6),
      backgroundColor: const Color(0xff7388A9),
    );
  }
}
