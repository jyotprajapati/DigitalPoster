import 'package:dposter/UI/signInView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'exploreView.dart';
import 'homePageView.dart';
import 'primiumView.dart';

class BasePageView extends StatefulWidget {
  const BasePageView({super.key});

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> {
  int _currntIndex = 0;
  List _currentScreen = [HomePageView(), ExploreView(), PrimiumView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen[_currntIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium),
            label: '',
          ),
        ],
        currentIndex: _currntIndex,
        selectedItemColor: Colors.blue[800],
        onTap: (int i) {
          _currntIndex = i;
          setState(() {});
        },
      ),
    );
  }
}
