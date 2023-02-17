import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';

class PosterPreview extends StatefulWidget {
  const PosterPreview({super.key});

  @override
  State<PosterPreview> createState() => _PosterPreviewState();
}

class _PosterPreviewState extends State<PosterPreview> {
  final dragController = DragController();
  Map<String, double> posLogo = {'top': 8, 'left': 8};
  bool isDrag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
                "https://m.media-amazon.com/images/I/61xtLtfNvYL._SL1000_.jpg"),
            Column(
              children: [
                Image.asset("assets/frames/frame2.png"),
              ],
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

                feedback: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/logo.png")),
                ),
                child: isDrag
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                            height: 60,
                            width: 60,
                            child: Image.asset("assets/logo.png")),
                      ),
              ),
            )
            // Align(
            //     heightFactor: 110,
            //     alignment: Alignment.bottomRight,
            //     child: Text("Email: raj.patel@gmail.com"))
          ],
        ),
      ),
    );
  }
}
