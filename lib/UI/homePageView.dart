import 'package:dposter/UI/myBusinessView.dart';
import 'package:dposter/UI/myPostView.dart';
import 'package:dposter/UI/privacyPolicyView.dart';
import 'package:dposter/UI/rateUsView.dart';
import 'package:dposter/UI/shareUsView.dart';
import 'package:dposter/UI/term&conditionView.dart';
import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
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
              "Home",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      border: Border.all(
                        color: const Color(0xFFD9D9D9),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 8; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Container(
                          height: 32,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Text(
                  "Upcoming Festival",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text(
                      "New York",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    const Text(
                      "More >",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 8; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text(
                      "Small Business",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    const Text(
                      "More >",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 8; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text(
                      "Industry",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    const Text(
                      "More >",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 8; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
