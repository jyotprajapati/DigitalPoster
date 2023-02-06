import 'package:flutter/material.dart';

class ProfileOptionsWidget {
  Widget profileOptionWidget(
      {required String topic,
      required String subTopic,
      required String ImageUrl,
      var navigateFunc}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: navigateFunc,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFD9D9D9),
                  backgroundImage: AssetImage("$ImageUrl"),
                  radius: 27.0,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$topic",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    Text("$subTopic")
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Color(0xFFD9D9D9),
                  radius: 15,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFF434343),
                    size: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
