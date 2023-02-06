import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';

class MyPostView extends StatefulWidget {
  const MyPostView({super.key});

  @override
  State<MyPostView> createState() => _MyPostViewState();
}

class _MyPostViewState extends State<MyPostView> {
  bool isImageSelected = true;
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
              "My Post",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        isImageSelected = true;
                        setState(() {});
                      },
                      child: Container(
                        // height: 100,
                        // width: 100,

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: isImageSelected
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6),
                          child: Center(
                            child: Text(
                              "Images",
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        isImageSelected = false;
                        setState(() {});
                      },
                      child: Container(
                        // height: 100,
                        // width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: !isImageSelected
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6),
                          child: Center(
                            child: Text(
                              "Video",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                    itemCount: 5)
              ],
            ),
          ),
        )
      ],
    );
  }
}
