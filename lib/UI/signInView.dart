import 'package:dposter/UI/signUpView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/buttonWidegets.dart';
import '../Widgets/textfieldWidgets.dart';
import 'basePageView.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Sign In",
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
                                  .textfieldWidgets(labelText: "Password"),
                              ButtonWidgets().normalButton(
                                  displayText: "Sign In",
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BasePageView()));
                                  }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Forgot Password",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
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
                                  const Text(
                                    "New user?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpView(),
                                            ));
                                      },
                                      child: const Text(
                                        "Sign Up",
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
