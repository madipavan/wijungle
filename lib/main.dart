import 'package:flutter/material.dart';
import 'package:wijungle/Presentation/Screens/DashBoard.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //for closing and minimizing window
  await windowManager.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Wijungle",
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
