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
                                      Color(0xFFF60AD0),
                                      Color(0xFF5A7AF7),
                                    ]
                                  : [Colors.transparent, Colors.transparent],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.only(
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
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
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
                                      Color(0xFFF60AD0),
                                      Color(0xFF5A7AF7),
                                    ]
                                  : [Colors.transparent, Colors.transparent],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.only(
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
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
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
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Select Business Categories',
                          style: TextStyle(color: Color(0xFF655E5E)),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 0, top: 0),
                      // labelText: "Sub Category",
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
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Business Name"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Mobile Number 1"),
                TextfieldWidgets().businessTextfieldWidgets(
                    labelText: "Mobile Number 2 (Optional)"),
                TextfieldWidgets().businessTextfieldWidgets(labelText: "Email"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Website"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Address"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Facebook"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Twitter"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Instagram"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Linked In"),
                TextfieldWidgets()
                    .businessTextfieldWidgets(labelText: "Youtube")
              ],
            ),
          ),
        )
      ],
    );
  }
}
