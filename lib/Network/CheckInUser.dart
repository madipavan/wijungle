import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wijungle/Domain/LoginApi.dart';
import 'package:wijungle/Presentation/Screens/AlertScreen.dart';

class Checkinuser {
  userloginstatus(context, username, password) async {
    //checking internet connection
    final isDevicesConnected = await InternetConnectionChecker().hasConnection;
    if (isDevicesConnected == true) {
      //we will proceed to loginsatus

      final loginstatus = await Loginapi().senduserlogin(username, password);

      //if status is success we will navigate to dashboard
      if (loginstatus["status"] == "success") {
        //to pop the loader
        Navigator.pop(context);
        //Navigating on dashboard
        Navigator.pushNamed(context, "/dashboard");
      } else {
        //to pop the loader
        Navigator.pop(context);
        Alertscreen().showdialogbox(context, "Invalid Credential",
            "Please Check Your Username And Password", Icons.person_off);
      }
    } else {
      //if there is no internet connection
      Alertscreen().showdialogbox(
          context,
          'No Internet Connection',
          'Please check your internet connection and try again.',
          Icons.wifi_off);
    }
  }
}
