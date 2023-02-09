import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/textfieldWidgets.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isValidateOn = false;

  emailValidation({required String email}) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp("$pattern");
    print("${!(regex.hasMatch(email))}");
    if (!(regex.hasMatch(email))) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          BackgroundWidget().homeBackgroundWidget(context),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: PopUpMenu().popupMenu(context: context),
              toolbarHeight: 38,
              elevation: 0,
              backgroundColor: const Color(0xFFD9D9D9),
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Your Name", controller: nameController),
                  if (isValidateOn && nameController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter valid name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Your Business email",
                      controller: emailController),
                  if (isValidateOn &&
                      (emailController.text == "" ||
                          emailValidation(email: emailController.text)))
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter valid Email",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      isValidateOn = true;
                      setState(() {});
                      if (_formKey.currentState!.validate()) {
                      } else {}
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF60AD0),
                                const Color(0xFF5A7AF7),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // SizedBox(
                            //   width: 6,
                            //   height: 25,
                            // ),
                            // Icon(
                            //   Icons.edit,
                            //   color: Colors.white,
                            // ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
