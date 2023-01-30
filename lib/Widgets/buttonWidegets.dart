import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWidgets {
  Widget normalButton({required String displayText, required var onPressed}) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
            shadowColor:
                MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.transparent)))),
        child: Text(
          "$displayText",
          style: TextStyle(fontSize: 16),
        ),
        onPressed: onPressed);
  }

  Widget socialButton({required String displayText, required IconData icon}) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
          shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.transparent)))),
      child: Row(
        children: [
          FaIcon(icon),
          Spacer(),
          Text(
            "$displayText",
            style: TextStyle(fontSize: 16),
          ),
          Spacer()
        ],
      ),
      onPressed: () {},
    );
  }
}
