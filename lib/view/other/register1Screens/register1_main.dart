import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/balance/commissionBalance.dart';
import 'package:rayan/model/modeApi/balance/userBalance.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/register1Screens/towButtonRegister1.dart';
import 'package:rayan/view/other/register1Screens/widgetRigerter1moy.dart';
import 'package:rayan/view/other/register2Screens/widgetRigerter2moy.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class register1Main extends StatefulWidget {
  register1Main({Key? key}) : super(key: key);

  @override
  State<register1Main> createState() => _register1Main();
}

class _register1Main extends State<register1Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        GetBuilder<homecontroller>(builder: (controller) {
          return (controller.i == 0 ? register1(context) : register2(context));
        }),
      ],
    ));
  }
}

Widget register2(context) {
  return ListView(
    shrinkWrap: true,
    children: [
      rowAppbar(context),
      towButtonRegister1(),
      Container(
          height: 148,
          margin: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff414D72), Color(0xff121E39)]),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Your walet balance".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Almarai')),
                  Text(balanceForUser.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 39,
                          fontFamily: 'Almarai'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Marketing Profits".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Almarai')),
                  Text(balancecommission.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 39,
                          fontFamily: 'Almarai'))
                ],
              ),
            ],
          )),
      Container(
        height: 284,
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff414D72), Color(0xff121E39)]),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: widgetRigerter2moy(),
      ),
    ],
  );
}

Widget register1(context) {
  return ListView(
    shrinkWrap: true,
    children: [
      rowAppbar(context),
      towButtonRegister1(),
      Container(
        height: 91,
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff414D72), Color(0xff121E39)]),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Your walet balance".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: 'Almarai')),
            Text(balanceForUser.toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: 39, fontFamily: 'Almarai'))
          ],
        ),
      ),
      Container(
        height: 350,
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff414D72), Color(0xff121E39)]),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: widgetRigerter1moy(),
      ),
    ],
  );
}
