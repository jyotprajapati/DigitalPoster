import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
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
              "Explore",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  children: const [
                    Text(
                      "New Year",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    Text(
                      "More >",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (_, index) => Padding(
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
                  itemCount: 25)
            ],
          ),
        )
      ],
    );
  }
}
