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
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Text(
                "المسابقات",
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'Almarai'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Text(
                "لا يمكن عرض مسابقات",
                style: TextStyle(
                    color: Colors.white, fontSize: 12, fontFamily: 'Almarai'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // widgetgallary(context),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "الرابحين",
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'Almarai'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Text(
                "لا يمكن عرض رابحيين",
                style: TextStyle(
                    color: Colors.white, fontSize: 12, fontFamily: 'Almarai'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // widetWinner(context)
          ],
        )
      ],
    ));
  }
}
