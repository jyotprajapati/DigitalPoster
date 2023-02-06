import 'package:flutter/material.dart';

import '../UI/myBusinessView.dart';
import '../UI/myPostView.dart';
import '../UI/privacyPolicyView.dart';
import '../UI/rateUsView.dart';
import '../UI/shareUsView.dart';
import '../UI/term&conditionView.dart';

class PopUpMenu {
  popupMenu({
    required BuildContext context,
  }) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      onSelected: (value) {
        if (value == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyPostView(),
              ));
        } else if (value == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyBusinessView(),
              ));
        } else if (value == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShareUsView(),
              ));
        } else if (value == 3) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RateUsView(),
              ));
        } else if (value == 4) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrivacyPolicyView(),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TermAndConditionsView(),
              ));
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<int>>[
          PopupMenuItem(
            child: Text('My Post'),
            value: 0,
          ),
          PopupMenuItem(child: Text('My Business'), value: 1),
          PopupMenuItem(child: Text('Share Us'), value: 2),
          PopupMenuItem(child: Text('Rate Us'), value: 3),
          PopupMenuItem(child: Text('Privacy Policy'), value: 4),
          PopupMenuItem(child: Text('Terms & Service'), value: 5),
        ];
      },
    );
  }
}
