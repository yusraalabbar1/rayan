import 'package:flutter/material.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/setting/notification/widgetRowForNotification.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class sittingNotification extends StatefulWidget {
  sittingNotification({Key? key}) : super(key: key);

  @override
  State<sittingNotification> createState() => _sittingNotificationState();
}

class _sittingNotificationState extends State<sittingNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        // rowAppbar(context),
        ListView(
          shrinkWrap: true,
          children: [
            rowAppbar(context),
            Container(
              height: 205,
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff414D72), Color(0xff121E39)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: widgetRowForNotification(),
            ),
          ],
        )
      ],
    ));
  }
}
