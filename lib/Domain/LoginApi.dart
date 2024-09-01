import 'dart:convert';

import 'package:http/http.dart' as http;

class Loginapi {
  //sending data on server
  Future<dynamic> senduserlogin(username, password) async {
    //url for userlogin postmethod
    String url =
        "https://mfatest.wijungle.com:9084/auth.php?type=login&username=$username&password=$password";
    //return status
    Map loginstatus = {};
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      loginstatus = await jsonDecode(response.body);
    } catch (e) {
      print("there is an error $e");
    }
    return loginstatus;
  }
}
