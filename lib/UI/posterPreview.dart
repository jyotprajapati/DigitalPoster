import 'package:dposter/Models/dragableImagesModel.dart';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_style_editor/text_style_editor.dart';

class PosterPreview extends StatefulWidget {
  const PosterPreview({super.key});

  @override
  State<PosterPreview> createState() => _PosterPreviewState();
}

class _PosterPreviewState extends State<PosterPreview> {
  final dragController = DragController();
  Map<String, double> posLogo = {'top': 8, 'left': 8};
  Map<String, double> posEmail = {'top': 310, 'left': 190};
  bool isDrag = false;
  bool isEmailDraged = false;
  double logoHeight = 60;
  double logoWidth = 60;
  int? selectedField;
  Color selectedColor = Colors.black;
  double textsize = 16;
  int? currentTap;

  bool textEditOn = false;
  var emailAlignment = TextAlign.left;

  double _emailScale = 1.0;
  int? texteditControlNo;

  int selectedlan = 0;
  int selectedImageNo = 0;

  List<Color> paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  TextStyle textStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'OpenSans',
  );
  TextAlign textAlign = TextAlign.left;

  List imagesInPic = [];

  getImagesInPoster() {
    imagesInPic.add(
        DragableImagesModel(url: "assets/logo.png", leftPos: 60, topPos: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textStyle = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontFamily: 'OpenSans',
    );

    textAlign = TextAlign.left;
  }

  @override
  Widget build(BuildContext context) {
    //fresh ups

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Image.network(
                    "https://m.media-amazon.com/images/I/61xtLtfNvYL._SL1000_.jpg"),
                Column(
                  children: [
                    Image.asset("assets/frames/frame2.png"),
                  ],
                ),
                Text(
                  "data jgug gygu gygutyutuytguygu gu",
                  style: TextStyle(fontFamily: "Lobster"),
                ),
                AnimatedPositioned(
                  top: posLogo['top'],
                  left: posLogo['left'],
                  duration: Duration(milliseconds: isDrag ? 0 : 300),
                  child: Draggable(
                    // initialPosition: AnchoringPosition.bottomLeft,
                    // dragController: dragController,
                    onDragStarted: () {
                      setState(() {
                        isDrag = true;
                      });
                    },
                    onDragUpdate: (details) {
                      setState(() {
                        print(details.delta.dx);
                        print(details.delta.dy);
                        posLogo = {
                          'left': posLogo['left']! + details.delta.dx,
                          'top': posLogo['top']! + details.delta.dy,
                        };
                      });
                    },
                    onDragEnd: (details) {
                      double width = MediaQuery.of(context).size.width;
                      double height = MediaQuery.of(context).size.width;

                      setState(() {
                        isDrag = false;
                        posLogo = {
                          'left': posLogo['left']!,
                          // < (width - (150 / 2) - (12 * 2)) / 2
                          //     ? 12
                          //     : width - 110 - 12,
                          'top': posLogo['top']!
                          // < (height - (150 / 2) - (12 * 2)) / 2
                          //     ? 12
                          //     : height - 12,
                        };
                      });
                    },
                    childWhenDragging: Container(),
                    feedback: GestureDetector(
                      onScaleUpdate: (details) {
                        logoHeight *= details.scale;
                        logoWidth *= details.scale;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                            height: logoHeight,
                            width: logoWidth,
                            child: Image.asset("assets/logo.png")),
                      ),
                    ),
                    child: isDrag
                        ? Container()
                        : GestureDetector(
                            onScaleUpdate: (details) {
                              logoHeight *= details.scale;
                              logoWidth *= details.scale;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                  height: logoHeight,
                                  width: logoWidth,
                                  child: Image.asset("assets/logo.png")),
                            ),
                          ),
                  ),
                ),
                AnimatedPositioned(
                  top: posEmail['top'],
                  left: posEmail['left'],
                  duration: Duration(milliseconds: isDrag ? 0 : 300),
                  child: Draggable(
                    onDragStarted: () {
                      setState(() {
                        isEmailDraged = true;
                      });
                    },
                    onDragUpdate: (details) {
                      setState(() {
                        print(details.delta.dx);
                        print(details.delta.dy);
                        posEmail = {
                          'left': posEmail['left']! + details.delta.dx,
                          'top': posEmail['top']! + details.delta.dy,
                        };
                      });
                    },
                    onDragEnd: (details) {
                      double width = MediaQuery.of(context).size.width;
                      double height = MediaQuery.of(context).size.width;
                      textEditOn = true;
                      setState(() {
                        isEmailDraged = false;
                        posEmail = {
                          'left': posEmail['left']!,
                          // < (width - (150 / 2) - (12 * 2)) / 2
                          //     ? 12
                          //     : width - 110 - 12,
                          'top': posEmail['top']!
                          // < (height - (150 / 2) - (12 * 2)) / 2
                          //     ? 12
                          //     : height - 12,
                        };
                      });
                    },
                    childWhenDragging: Container(),
                    feedback: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Material(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: textEditOn
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 1),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                textEditOn = !textEditOn;
                                setState(() {});
                              },
                              child: Text(
                                "trial.email@gmail.com",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            )),
                      ),
                    ),
                    child: isEmailDraged
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: textEditOn
                                          ? Colors.white
                                          : Colors.transparent,
                                      width: 1),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    textEditOn = !textEditOn;

                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "trial.email@gmail.com",
                                      textAlign: emailAlignment,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                )),
                          ),
                  ),
                )
              ],
            ),
            Spacer(),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(
            //               border:
            //                   Border.all(color: Color(0xFFFEA500), width: 1.5),
            //               borderRadius: BorderRadius.all(Radius.circular(18))),
            //           child: Padding(
            //             padding: const EdgeInsets.all(4.0),
            //             child: Text(
            //               "Light Mode",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 8,
            //         ),
            //         Container(
            //           decoration: BoxDecoration(
            //               border:
            //                   Border.all(color: Color(0xFFFEA500), width: 1.5),
            //               borderRadius: BorderRadius.all(Radius.circular(18))),
            //           child: Padding(
            //             padding: const EdgeInsets.all(4.0),
            //             child: Text(
            //               "Dark Mode",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           decoration: BoxDecoration(
            //               border:
            //                   Border.all(color: Colors.transparent, width: 1.5),
            //               color: Color(0xFFFEA500),
            //               borderRadius: BorderRadius.all(Radius.circular(18))),
            //           child: Text(
            //             "Light Mode",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Container(
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: Row(
            //             children: [
            //               for (int i = 0; i < 5; i++)
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 6),
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                         border: Border.all(
            //                             color: Color(0xFFFEA500), width: 1.5),
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(0))),
            //                     height: 80,
            //                     child: Image.network(
            //                         "https://image.similarpng.com/very-thumbnail/2021/06/Gold-decorative-picture-frame-isolated-on-transparent-background-PNG.png"),
            //                   ),
            //                 ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Container(
                color: Color(0xFF252525),
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                texteditControlNo = 0;
                                setState(() {});
                              },
                              child: Container(
                                color: texteditControlNo == 0
                                    ? Color(0xFFFEA500)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Controls",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                texteditControlNo = 1;
                                setState(() {});
                              },
                              child: Container(
                                color: texteditControlNo == 1
                                    ? Color(0xFFFEA500)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Color and Opacity",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                texteditControlNo = 2;
                                setState(() {});
                              },
                              child: Container(
                                color: texteditControlNo == 2
                                    ? Color(0xFFFEA500)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "3D",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                posLogo['left'] = posLogo['left']! - 1;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.arrow_left_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    posLogo['top'] = posLogo['top']! - 1;
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    posLogo['top'] = posLogo['top']! + 1;
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                posLogo['left'] = posLogo['left']! + 1;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 24),
                                        child: Text(
                                          "Dublicate",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 6),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 10),
                                        child: Text(
                                          "Change Image",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ])),

            Container(
              color: Color(0xFF252525),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            texteditControlNo = 0;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 0
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Controls",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            texteditControlNo = 1;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 1
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Fonts",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            texteditControlNo = 2;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 2
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Colors",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            texteditControlNo = 3;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 3
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Space & opacity",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            texteditControlNo = 4;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 4
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Shadow",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            texteditControlNo = 5;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 5
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Bg",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            texteditControlNo = 6;
                            setState(() {});
                          },
                          child: Container(
                            color: texteditControlNo == 6
                                ? Color(0xFFFEA500)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "3D",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            posEmail['left'] = posEmail['left']! - 1;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Icons.arrow_left_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                posEmail['top'] = posEmail['top']! - 1;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                posEmail['top'] = posEmail['top']! + 1;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            posEmail['left'] = posEmail['left']! + 1;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {
                            emailAlignment = TextAlign.left;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: emailAlignment == TextAlign.left
                                      ? Color(0xFFFEA500)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.format_align_left,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            emailAlignment = TextAlign.center;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: emailAlignment == TextAlign.center
                                      ? Color(0xFFFEA500)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.format_align_center,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            emailAlignment = TextAlign.right;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: emailAlignment == TextAlign.right
                                      ? Color(0xFFFEA500)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.format_align_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "Dublicate",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, top: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 24),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //           color: Color(0xFFFEA500), width: 1.5),
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(18))),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(4.0),
                      //     child: Text(
                      //       "Hindi",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //           color: Color(0xFFFEA500), width: 1.5),
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(18))),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(4.0),
                      //     child: Text(
                      //       "Gujarati",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              selectedlan = 0;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFFEA500), width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "English",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Gujarati",
                            ),
                          ),
                          Container(
                            child: Text(
                              "Hindi & Marathi",
                            ),
                          ),
                          Container(
                            child: Text(
                              "Tamil",
                            ),
                          ),
                          Container(
                            child: Text(
                              "Kannad",
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "English",
                                style: GoogleFonts.alegreya(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "English",
                                style: GoogleFonts.aguafinaScript(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       CircleAvatar(
            //         child: Dialog(
            //           child: Text(
            //             "Color",
            //             selectionColor: Colors.white,
            //           ),
            //         ),
            //       ),
            //       Dialog(
            //         child: Text("Text Color"),
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   child: Row(
            //     children: [
            //       Slider(
            //         value: 175,
            //         min: 120.0,
            //         max: 220.0,
            //         activeColor: Colors.white,
            //         inactiveColor: Color(0xFF8D8E98),
            //         onChanged: (double newValue) {
            //           setState(() {
            //             // height = newValue.round();
            //           });
            //         },
            //       ),
            //       Icon(
            //         Icons.text_format,
            //         color: Colors.white,
            //       ),
            //       Slider(
            //         value: 0.4,
            //         inactiveColor: Color(0xFFFEA500).withOpacity(0.5),
            //         activeColor: Color(0xFFFEA500),
            //         onChanged: (value) {},
            //       ),
            //       Icon(
            //         Icons.text_format,
            //         color: Colors.white,
            //       ),
            //       Slider(
            //         value: 0.4,
            //         inactiveColor: Color(0xFFFEA500).withOpacity(0.5),
            //         activeColor: Color(0xFFFEA500),
            //         onChanged: (value) {},
            //       ),
            //       Icon(
            //         Icons.text_format,
            //         color: Colors.white,
            //       ),
            //       Slider(
            //         value: 0.4,
            //         inactiveColor: Color(0xFFFEA500).withOpacity(0.5),
            //         activeColor: Color(0xFFFEA500),
            //         onChanged: (value) {},
            //       )
            //     ],
            //   ),
            // ),

            Container(
              color: Color(0xFFFEA500),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      selectedField = 0;
                      setState(() {});
                    },
                    child: Container(
                      color: selectedField == 0
                          ? selectedColor
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        child: Icon(
                          Icons.filter_frames,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedField = 1;
                      setState(() {});
                    },
                    child: Container(
                      color: selectedField == 1
                          ? selectedColor
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        child: Icon(
                          Icons.text_fields,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
