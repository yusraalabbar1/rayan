import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/other/homeMainScreens/widget_home.dart';

Widget widgetTowButtonagent() {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 15, right: 30, left: 30),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 127,
        height: 37,
        child: RaisedButton(
          onPressed: () {
            print('Button Clicked.');
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Text(
            "مصر",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
          ),
          textColor: Colors.white,
          splashColor: Colors.white,
          color: MyColors.color1,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: 127,
        height: 37,
        child: RaisedButton(
          onPressed: () {
            print('Button Clicked.');
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Text(
            "القاهرة",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
          ),
          textColor: Colors.white,
          splashColor: Colors.white,
          color: MyColors.color1,
        ),
      ),
    ]),
  );
}
