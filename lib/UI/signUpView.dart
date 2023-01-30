import 'package:dposter/UI/signInView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/buttonWidegets.dart';
import '../Widgets/textfieldWidgets.dart';
import 'basePageView.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget().backgroundWidget(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          CustomBoxShadow(
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 5.0,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    shadows: <Shadow>[
                                      Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0))
                                    ]),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextfieldWidgets()
                                  .textfieldWidgets(labelText: "Username"),
                              TextfieldWidgets()
                                  .textfieldWidgets(labelText: "Email"),
                              TextfieldWidgets()
                                  .textfieldWidgets(labelText: "Mobile No"),
                              TextfieldWidgets()
                                  .textfieldWidgets(labelText: "Password"),
                              TextfieldWidgets().textfieldWidgets(
                                  labelText: "Confirm Password"),
                              ButtonWidgets().normalButton(
                                  displayText: "Sign Up",
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BasePageView()));
                                  }),
                              ButtonWidgets().socialButton(
                                  displayText: "Google",
                                  icon: FontAwesomeIcons.google),
                              ButtonWidgets().socialButton(
                                  displayText: "Facebook",
                                  icon: FontAwesomeIcons.facebook),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInView(),
                                            ));
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
