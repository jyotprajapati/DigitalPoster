import 'package:dposter/UI/signInView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'homePageView.dart';

class BasePageView extends StatefulWidget {
  const BasePageView({super.key});

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> {
  int _currntIndex = 0;
  List _currentScreen = [HomePageView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen[_currntIndex],
      bottomNavigationBar:
          // SnakeNavigationBar.color(
          //   // behaviour: snakeBarStyle,
          //   // snakeShape: snakeShape,
          //   // shape: bottomBarShape,
          //   // padding: ,

          //   ///configuration for SnakeNavigationBar.color
          //   snakeViewColor: Colors.white,
          //   selectedItemColor: Colors.black,
          //   // snakeShape == SnakeShape.indicator ? selectedColor : null,
          //   unselectedItemColor: Colors.blueGrey,

          //   ///configuration for SnakeNavigationBar.gradient
          //   //snakeViewGradient: selectedGradient,
          //   //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
          //   //unselectedItemGradient: unselectedGradient,

          //   // showUnselectedLabels: showUnselectedLabels,
          //   // showSelectedLabels: showSelectedLabels,

          //   currentIndex: _currntIndex,
          //   onTap: (index) {},
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
          //   ],
          // ),
          BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
        ],
        currentIndex: _currntIndex,
        selectedItemColor: Colors.blue[800],
        onTap: (int i) {},
      ),
    );
  }
}
