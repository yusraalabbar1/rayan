import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/view/other/homeMainScreens/widget_home.dart';

Widget widgetBalanceGaust(context) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff414D72), Color(0xff121E39)]),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    margin: EdgeInsets.all(20),
    height: 191, //(MediaQuery.of(context).size.height) / 4,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Total available balance".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontFamily: 'BAHNSCHRIFT'),
                  ),
                ),
                Container(
                  child: Text(
                    "USD",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'BAHNSCHRIFT'),
                  ),
                ),
              ],
            )
          ],
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 127,
              height: 50,
              child: RaisedButton.icon(
                onPressed: () {
                  print('Button Clicked.');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                label: Text(
                  "send".tr,
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
                ),
                icon: Icon(
                  Icons.call_made,
                  color: Colors.white,
                ),
                textColor: Colors.white,
                splashColor: Colors.white,
                color: Color(0xff464699),
              ),
            )
            // SizedBox(
            //   height: 20,
            // ),
            //buttonrec("استقبال", Icons.call_received, context),
          ],
        )),
      ],
    ),
  );
}
