import 'package:dposter/UI/basePageView.dart';
import 'package:dposter/UI/homePageView.dart';
import 'package:dposter/UI/signUpView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  getLoggedInDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    return userId;
  }

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    var userId = getLoggedInDetails();
    if (userId == null) {
      new Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUpView()),
              ));
    } else {
      new Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BasePageView()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          child: Image.asset("assets/logo.png"),
        ),
      ],
    );
  }
}
