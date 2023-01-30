import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';

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
          drawer: const Drawer(
            elevation: 50,
            shadowColor: Colors.black,
          ),
          appBar: AppBar(
            toolbarHeight: 38,
            elevation: 0,
            backgroundColor: const Color(0xFFD9D9D9),
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
