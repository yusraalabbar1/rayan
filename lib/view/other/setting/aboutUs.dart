import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class about extends StatefulWidget {
  about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        //rowAppbar(context),
        Center(
          child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff414D72), Color(0xff121E39)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("About Us".tr,
                      style: TextStyle(
                          color: MyColors.color1,
                          fontSize: 16,
                          height: 1.5,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(aboutUs,
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
              )),
        ),
      ],
    ));
  }
}
