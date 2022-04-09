import 'package:flutter/material.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class page1Gaust extends StatefulWidget {
  page1Gaust({Key? key}) : super(key: key);

  @override
  State<page1Gaust> createState() => _page1GaustState();
}

class _page1GaustState extends State<page1Gaust> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        Center(
          child: Text("pleas Login to active the application service",
              style: TextStyle(
                  color: Colors.white, fontSize: 17, fontFamily: 'Almarai')),
        ),
      ],
    ));
  }
}
