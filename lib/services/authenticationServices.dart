import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/emailLoginModel.dart';

class AuthenticationServices {
  emailLogin({required String email, required String password}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      http.Response response = await http.post(
          Uri.parse("https://mehulpatels.in/public/userlogin"),
          body: {"email": "$email", "password": "$password"});
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        print(jsonResponse['data'][0]);

        sharedPreferences.setInt("userId", jsonResponse['data'][0]['id'] ?? 0);
        sharedPreferences.setString(
            "userEmail", jsonResponse['data'][0]['email']);
        sharedPreferences.setString(
            "userName", jsonResponse['data'][0]['name']);
        sharedPreferences.setString(
            "userImage", jsonResponse['data'][0]['image']);
        sharedPreferences.setString(
            "userMobile", jsonResponse['data'][0]['mobile']);
        sharedPreferences.setInt(
            "userPlan", jsonResponse['data'][0]['plan'] ?? 0);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
