import 'package:flutter/material.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/gaust/rowAppbarGaust.dart';
import 'package:rayan/view/other/gaust/widgetBalanceGaust.dart';

class HomeGaust extends StatefulWidget {
  HomeGaust({Key? key}) : super(key: key);

  @override
  State<HomeGaust> createState() => _HomeGaustState();
}

class _HomeGaustState extends State<HomeGaust> {
  // allAgent = [];
  // winner = [];
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            rowAppbarGaust(context),
            widgetBalanceGaust(context),
          ],
        )
      ],
    ));
  }
}
