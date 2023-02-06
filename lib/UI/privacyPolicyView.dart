import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/textfieldWidgets.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
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
              "Privacy Policy",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).ṅ",
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 14)),
                      ),
                    ],
                  ),
                  width: 100,
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
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
