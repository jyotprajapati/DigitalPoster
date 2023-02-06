import 'package:dposter/UI/myPostView.dart';
import 'package:dposter/UI/privacyPolicyView.dart';
import 'package:dposter/UI/rateUsView.dart';
import 'package:dposter/UI/shareUsView.dart';
import 'package:dposter/UI/term&conditionView.dart';
import 'package:flutter/material.dart';

import '../Widgets/backgoundWidget.dart';
import '../Widgets/popUpMenuWidget.dart';
import '../Widgets/profileOptionsWidget.dart';
import 'editProfileView.dart';
import 'myBusinessView.dart';

class ProfileView extends StatefulWidget {
  BuildContext homeBuildContext;
  ProfileView({super.key, required this.homeBuildContext});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFA09696),
                        radius: 50.0,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          child: Text(
                            "P",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)),
                          ),
                          radius: 46.0,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileView(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFF60AD0),
                                  const Color(0xFF5A7AF7),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6,
                              height: 25,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Edit Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, top: 10),
                  child: Text(
                    "User Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, top: 2),
                  child: Text(
                    "useremail@gmail.com",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ProfileOptionsWidget().profileOptionWidget(
                    ImageUrl: "assets/Images/Ellipse3.png",
                    topic: "My Post",
                    subTopic: "Your all saved post.",
                    navigateFunc: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPostView(),
                        ))),
                ProfileOptionsWidget().profileOptionWidget(
                    ImageUrl: "assets/Images/Ellipse4.png",
                    topic: "My Business",
                    subTopic: "Your all added business",
                    navigateFunc: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBusinessView(),
                        ))),
                ProfileOptionsWidget().profileOptionWidget(
                    ImageUrl: "assets/Images/Ellipse5.png",
                    topic: "Share Us",
                    subTopic: "Share to your friends and family",
                    navigateFunc: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareUsView(),
                        ))),
                ProfileOptionsWidget().profileOptionWidget(
                    ImageUrl: "assets/Images/Ellipse6.png",
                    topic: "Rate Us",
                    subTopic: "Please share your experience.",
                    navigateFunc: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RateUsView(),
                          ),
                        )),
                ProfileOptionsWidget().profileOptionWidget(
                    ImageUrl: "assets/Images/Ellipse7.png",
                    topic: "Privacy Policy",
                    subTopic: "Read our privacy policy.",
                    navigateFunc: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyPolicyView(),
                          ),
                        )),
                ProfileOptionsWidget().profileOptionWidget(
                    ImageUrl: "assets/Images/Ellipse8.png",
                    topic: "Terms & Service",
                    subTopic: "Please accept our terms.",
                    navigateFunc: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TermAndConditionsView(),
                          ),
                        ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
