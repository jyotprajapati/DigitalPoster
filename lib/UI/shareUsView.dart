import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/textfieldWidgets.dart';

class ShareUsView extends StatefulWidget {
  const ShareUsView({super.key});

  @override
  State<ShareUsView> createState() => _ShareUsViewState();
}

class _ShareUsViewState extends State<ShareUsView> {
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
              "Share Us",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/icons/whatsapp.png"),
                          Image.asset("assets/icons/gmail-new.png"),
                          Image.asset("assets/icons/facebook.png"),
                          Image.asset("assets/icons/instagram.png")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/icons/linkedin.png"),
                          Image.asset("assets/icons/youtube.png"),
                          Image.asset("assets/icons/twitter.png"),
                          Image.asset("assets/icons/tiktok.png")
                        ],
                      )
                    ],
                  ),
                  height: 200,
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
