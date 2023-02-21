import 'package:dposter/UI/posterPreview.dart';
import 'package:flutter/material.dart';

class FrameSelectionView extends StatefulWidget {
  const FrameSelectionView({super.key});

  @override
  State<FrameSelectionView> createState() => _FrameSelectionViewState();
}

class _FrameSelectionViewState extends State<FrameSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PosterPreview(),
              ));
        },
        child: Icon(Icons.arrow_forward_outlined),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                  "https://m.media-amazon.com/images/I/61xtLtfNvYL._SL1000_.jpg"),
              Image.asset("assets/frames/frame2.png")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Select frame",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
          ),
          GridView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (_, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Image.asset("assets/frames/frame2.png")),
              itemCount: 1)
        ],
      ),
    );
  }
}
