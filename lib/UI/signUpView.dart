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
  final _formKey = new GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget().backgroundWidget(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Stack(
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
                                TextfieldWidgets().textfieldWidgets(
                                  labelText: "Username",
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter valid username.';
                                    }
                                    return null;
                                  },
                                ),
                                TextfieldWidgets().textfieldWidgets(
                                  labelText: "Email",
                                  validator: (value) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp("$pattern");
                                    if (!(regex.hasMatch(value)))
                                      return "Invalid Email";
                                    return null;
                                  },
                                ),
                                TextfieldWidgets().textfieldWidgets(
                                  labelText: "Mobile No",
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length! != 10) {
                                      return 'Please enter valid Mobile no.';
                                    }
                                    return null;
                                  },
                                ),
                                TextfieldWidgets().textfieldWidgets(
                                  labelText: "Password",
                                  controller: passwordController,
                                  password: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 6) {
                                      return 'Please enter with min 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                                TextfieldWidgets().textfieldWidgets(
                                  labelText: "Confirm Password",
                                  controller: cPasswordController,
                                  password: true,
                                  validator: (value) {
                                    if (value != passwordController.text) {
                                      return 'Password donot match';
                                    }
                                    return null;
                                  },
                                ),
                                ButtonWidgets().normalButton(
                                    displayText: "Sign Up",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BasePageView()));
                                      } else {}
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
                                            decoration:
                                                TextDecoration.underline,
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
          ),
        )
      ],
    );
  }
}
