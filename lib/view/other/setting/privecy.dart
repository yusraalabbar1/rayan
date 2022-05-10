import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class privecy extends StatelessWidget {
  const privecy({Key? key}) : super(key: key);

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
        Center(
          child: Container(
              margin: EdgeInsets.only(right: 15, left: 15, top: 50, bottom: 50),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff414D72), Color(0xff121E39)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("privacy policy".tr,
                        style: TextStyle(
                            color: MyColors.color1,
                            fontSize: 16,
                            height: 1.5,
                            fontFamily: 'Almarai')),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(Privacy,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 3,
                              fontFamily: 'Almarai')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
