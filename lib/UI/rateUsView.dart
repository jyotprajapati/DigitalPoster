import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/textfieldWidgets.dart';

class RateUsView extends StatefulWidget {
  const RateUsView({super.key});

  @override
  State<RateUsView> createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  int SelectedStarIndex = 3;
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
              "Rate Us",
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
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 14)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i <= 4; i++)
                              InkWell(
                                onTap: () {
                                  SelectedStarIndex = i;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.star,
                                  color: i <= SelectedStarIndex
                                      ? Color(0xFF9739F4)
                                      : Colors.white,
                                  size: 40,
                                ),
                              )
                          ],
                        ),
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
