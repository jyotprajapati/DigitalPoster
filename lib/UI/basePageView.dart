import 'package:dposter/UI/signInView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'exploreView.dart';
import 'homePageView.dart';
import 'primiumView.dart';
import 'profileView.dart';

class BasePageView extends StatefulWidget {
  const BasePageView({super.key});

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _currentScreen = [
      HomePageView(),
      ExploreView(),
      PrimiumView(),
      ProfileView(
        homeBuildContext: context,
      )
    ];
    return Scaffold(
      
      body: _currentScreen[_currentIndex],
      backgroundColor: Color(0xFFA19898),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color(0xFFA19898),
              border: Border.all(
                color: Color(0xFFA19898),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    _currentIndex = 0;
                    setState(() {});
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: _currentIndex == 0
                              ? Color(0xFF1FCAF5)
                              : Color(0xFFA3A7A8),
                          border: Border.all(
                            color: Color(0xFFA3A7A8),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Image.asset(
                          "assets/icons/Home.png",
                          width: 21,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    _currentIndex = 1;
                    setState(() {});
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: _currentIndex == 1
                              ? Color(0xFF1FCAF5)
                              : Color(0xFFA3A7A8),
                          border: Border.all(
                            color: Color(0xFFA3A7A8),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 20),
                        child: Image.asset(
                          "assets/icons/Compass.png",
                          width: 21,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    _currentIndex = 2;
                    setState(() {});
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: _currentIndex == 2
                              ? Color(0xFF1FCAF5)
                              : Color(0xFFA3A7A8),
                          border: Border.all(
                            color: Color(0xFFA3A7A8),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 20),
                        child: Image.asset(
                          "assets/icons/Crown.png",
                          width: 21,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    _currentIndex = 3;
                    setState(() {});
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: _currentIndex == 3
                              ? Color(0xFF1FCAF5)
                              : Color(0xFFA3A7A8),
                          border: Border.all(
                            color: Color(0xFFA3A7A8),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 20),
                        child: Image.asset(
                          "assets/icons/Account.png",
                          width: 21,
                        ),
                      )),
                ),
              )
            ],
          )),
      //  BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.workspace_premium),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: _currntIndex,
      //   selectedItemColor: Colors.blue[800],
      //   onTap: (int i) {
      //     _currntIndex = i;
      //     setState(() {});
      //   },
      // ),
    );
  }
}
