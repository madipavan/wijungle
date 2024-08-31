import 'package:flutter/material.dart';
import 'package:wijungle/Core/ScreenSize.dart';
import 'package:wijungle/Network/CpuRamUsage.dart';
import 'package:wijungle/Presentation/Screens/Widgets/CpuRamCharts/CpuUsage.dart';
import 'package:wijungle/Presentation/Screens/Widgets/CpuRamCharts/RamUsage.dart';
import 'package:wijungle/Presentation/Screens/Widgets/custom_iconbtn.dart';
import 'package:window_manager/window_manager.dart';

class HomedrawerColumn extends StatefulWidget {
  const HomedrawerColumn({super.key});

  @override
  State<HomedrawerColumn> createState() => _HomedrawerColumnState();
}

class _HomedrawerColumnState extends State<HomedrawerColumn> {
  bool datafetched = true;
  String CPUpercent = "";
  String RAMpercent = "";
  @override
  void initState() {
    setState(() {
      // _getdata();
    });
    super.initState();
  }

  _getdata() async {
    CPUpercent = await Cpuramusage().getCPUusage();
    RAMpercent = await Cpuramusage().getRAMusage();
    setState(() {
      datafetched = true;
    });
    print(CPUpercent);
    print(RAMpercent);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return datafetched
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomIconbtn(
                      icon: const Icon(Icons.minimize),
                      onPressed: () async {
                        await windowManager.minimize();
                      },
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.01,
                    ),
                    CustomIconbtn(
                      icon: const Icon(Icons.close),
                      onPressed: () async {
                        await windowManager.close();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Analytics",
                      style: TextStyle(fontSize: ScreenSize.width * 0.02),
                    ),
                    SizedBox(
                      height: ScreenSize.height * 0.08,
                      width: ScreenSize.width * 0.085,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Hello",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "User",
                                style: TextStyle(
                                    fontSize: ScreenSize.width * 0.016),
                              )
                            ],
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.01,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(15)),
                              height: ScreenSize.height * 0.065,
                              width: ScreenSize.width * 0.04,
                              child: Image.asset(
                                "assets/images/man2.png",
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenSize.height * 0.2,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Cpuusage(),
                    Ramusage(),
                  ],
                )
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
