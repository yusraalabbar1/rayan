import 'package:flutter/material.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class initPage extends StatefulWidget {
  initPage({Key? key}) : super(key: key);

  @override
  State<initPage> createState() => _initPageState();
}

class _initPageState extends State<initPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wstContainer1(context),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Text(
                    "",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColors.color3,
                        fontFamily: 'Almarai'),
                  ),
                ),
                Center(
                  child: buttonStart(MyColors.color2, MyColors.color1,
                      "هيا لنبدأ", MyColors.color3, context, "langPage"),
                ),
              ],
            ) /* add child content here */,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق 2022",
                style: TextStyle(
                    fontSize: 13,
                    color: MyColors.color3,
                    fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
