import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/textfieldWidgets.dart';

class MyBusinessView extends StatefulWidget {
  const MyBusinessView({super.key});

  @override
  State<MyBusinessView> createState() => _MyBusinessViewState();
}

class _MyBusinessViewState extends State<MyBusinessView> {
  bool isBusinessSelected = true;
  TextEditingController bNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController mobile2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();

  emailValidation({required String email}) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp("$pattern");
    print("${!(regex.hasMatch(email))}");
    if (!(regex.hasMatch(email))) return true;
    return false;
  }

  final _formKey = new GlobalKey<FormState>();
  bool isValidateOn = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              "My Business",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          isBusinessSelected = true;
                          setState(() {});
                        },
                        child: Container(
                          // height: 100,
                          // width: 100,

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: isBusinessSelected
                                    ? [
                                        const Color(0xFFF60AD0),
                                        const Color(0xFF5A7AF7),
                                      ]
                                    : [Colors.transparent, Colors.transparent],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: const BorderRadius.only(
                              // topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                              // style: BorderStyle.solid,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Center(
                              child: Text(
                                "Business",
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isBusinessSelected = false;
                          setState(() {});
                        },
                        child: Container(
                          // height: 100,
                          // width: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: !isBusinessSelected
                                    ? [
                                        const Color(0xFFF60AD0),
                                        const Color(0xFF5A7AF7),
                                      ]
                                    : [Colors.transparent, Colors.transparent],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: const BorderRadius.only(
                              // topRight: Radius.circular(40),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                              // style: BorderStyle.solid,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Center(
                              child: Text(
                                "Politicals",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      items: <String>["Cat 1", "Cat2"].map((_value) {
                        return DropdownMenuItem<String>(
                          value: _value,
                          child: Text(
                            '$_value',
                            style: TextStyle(color: Color(0xFF655E5E)),
                          ),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select category';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Select Business Category",
                        filled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 0, top: 0),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          // <--- this line
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(10), // <--- this line
                        ),
                        border: OutlineInputBorder(
                          // <--- this line

                          borderRadius:
                              BorderRadius.circular(10), // <--- this line
                        ),
                      ),
                    ),
                  ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Business Name", controller: bNameController),
                  if (isValidateOn && bNameController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid name",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Mobile Number 1",
                      keyboardType: TextInputType.number,
                      controller: mobileController),
                  if (isValidateOn && mobileController.text.length != 10)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Mobile number",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                    labelText: "Mobile Number 2 (Optional)",
                    keyboardType: TextInputType.number,
                  ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Email", controller: emailController),
                  if (isValidateOn &&
                      (emailController.text == "" ||
                          emailValidation(email: emailController.text)))
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid email",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Website", controller: websiteController),
                  if (isValidateOn && websiteController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Website",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Address", controller: addressController),
                  if (isValidateOn && addressController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Address",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Facebook", controller: facebookController),
                  if (isValidateOn && facebookController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Facebook",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Twitter", controller: twitterController),
                  if (isValidateOn && twitterController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Twitter",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Instagram", controller: instagramController),
                  if (isValidateOn && instagramController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Instagram",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "LinkedIn", controller: linkedInController),
                  if (isValidateOn && linkedInController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid LinkedIn",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  TextfieldWidgets().businessTextfieldWidgets(
                      labelText: "Youtube", controller: youtubeController),
                  if (isValidateOn && youtubeController.text.length < 3)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        "Enter valid Youtube",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(35),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFF666666),
                                    radius: 14,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Light logo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(35),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFF666666),
                                    radius: 14,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Dark logo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 35),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFF666666),
                                    radius: 14,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Light watermark",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 35),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFF666666),
                                    radius: 14,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Dark watermark",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                    const Color(0xFF7F2CE5),
                                    const Color(0xFFD70DE9),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                              ),
                              Text("Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          bNameController = TextEditingController();
                          mobileController = TextEditingController();
                          mobile2Controller = TextEditingController();
                          emailController = TextEditingController();
                          websiteController = TextEditingController();
                          addressController = TextEditingController();
                          facebookController = TextEditingController();
                          twitterController = TextEditingController();
                          instagramController = TextEditingController();
                          linkedInController = TextEditingController();
                          youtubeController = TextEditingController();
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFD70DE9),
                                    const Color(0xFF7F2CE5),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                              ),
                              Text("Clear",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
