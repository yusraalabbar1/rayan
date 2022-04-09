import 'package:flutter/material.dart';
import 'package:rayan/model/modeApi/modelsCompt/common_questions.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class questionComm extends StatelessWidget {
  const questionComm({Key? key}) : super(key: key);

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
        ListView.builder(
          itemCount: question.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff414D72), Color(0xff121E39)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Text(question[index]["question"],
                      style: TextStyle(
                          color: MyColors.color1,
                          fontSize: 14,
                          height: 1.5,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(question[index]["answer"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          height: 1.5,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        )
      ],
    ));
  }
}
