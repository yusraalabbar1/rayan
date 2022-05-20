import 'package:flutter/material.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class pageEmpty extends StatefulWidget {
  pageEmpty({Key? key}) : super(key: key);

  @override
  State<pageEmpty> createState() => _pageEmptyState();
}

class _pageEmptyState extends State<pageEmpty> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print(
              'Backbutton pressed (device or appbar button), do whatever you want.');

          //trigger leaving and use own data
          // Navigator.pop(context, false);
          Navigator.pushReplacementNamed(context, 'homePage');

          //we need to return a future
          return Future.value(false);
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                containerMaine(),
                Container(
                  decoration: boxDecorationMain(),
                ),
                ListView(
                  // shrinkWrap: true,
                  children: [
                    rowAppbar(context),
                  ],
                )
              ],
            )));
  }
}
