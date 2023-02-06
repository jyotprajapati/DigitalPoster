import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';

class PrimiumView extends StatelessWidget {
  const PrimiumView({super.key});

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
              "Primium",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Text(
                  "Premium Activated",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Access to all posts and Premium Posts with no ads and save posts with high quality.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20, right: MediaQuery.of(context).size.width * 0.5),
                  child: Container(
                    // height: 32,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Subscription",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        border: Border.all(
                          color: const Color(0xFFD9D9D9),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "New York",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                    itemCount: 1),
                Text(
                  "Diwali",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                    itemCount: 2),
                Text(
                  "Karva Chauth",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                    itemCount: 8)
              ],
            ),
          ),
        )
      ],
    );
  }
}
