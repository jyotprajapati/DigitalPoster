import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';

class PosterPreview extends StatefulWidget {
  const PosterPreview({super.key});

  @override
  State<PosterPreview> createState() => _PosterPreviewState();
}

class _PosterPreviewState extends State<PosterPreview> {
  final dragController = DragController();
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
            DraggableWidget(
              initialPosition: AnchoringPosition.bottomLeft,
              dragController: dragController,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/logo.png")),
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
