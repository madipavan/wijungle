import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wijungle/Presentation/Screens/DashBoard.dart';
import 'package:wijungle/Presentation/Screens/UserLogin.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //for closing and minimizing window
  await windowManager.ensureInitialized();
  // to disable ssl verification
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wijungle",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Userlogin(),
        "/dashboard": (context) => const Dashboard(),
      },
      initialRoute: "/",
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
