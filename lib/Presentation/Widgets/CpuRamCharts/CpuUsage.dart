import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wijungle/Core/ScreenSize.dart';
import 'package:wijungle/Network/CpuRamUsage.dart';

class Cpuusage extends StatefulWidget {
  const Cpuusage({super.key});

  @override
  State<Cpuusage> createState() => _CpuusageState();
}

class _CpuusageState extends State<Cpuusage> {
  String cpudata = "";
  double CPUpercent = 0;

  @override
  void initState() {
    setState(() {
      _getdata();
    });

    super.initState();
  }

  _getdata() async {
    cpudata = await Cpuramusage().getCPUusage();

    setState(() {
      CPUpercent = double.parse(cpudata);
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
            "${CPUpercent.round().toString()}%",
            style: TextStyle(
                fontSize: ScreenSize.width * 0.02, fontWeight: FontWeight.bold),
          ),
          Text(
            "CPU",
            style: TextStyle(
                fontSize: ScreenSize.width * 0.02, fontWeight: FontWeight.bold),
          )
        ],
      ),
      radius: ScreenSize.width * 0.08,
      lineWidth: ScreenSize.width * 0.015,
      circularStrokeCap: CircularStrokeCap.round,
      percent: CPUpercent / 100,
      progressColor: const Color(0xff147AD6),
      backgroundColor: const Color(0xff7388A9),
    );
  }
}
