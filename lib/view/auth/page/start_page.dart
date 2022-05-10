import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelSetting/getcountery.dart';
import 'package:rayan/model/modeApi/modelSetting/setting_time_otp.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/gaust/gaust.dart';
import 'package:rayan/view/other/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class startPage extends StatefulWidget {
  startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  homecontroller controller = Get.put(homecontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("start page:************");
    myJsonCountry = [];
    getSettingTerms();
    getCoutery();
    getSettingSpictimeOtp();
    // getSettingSpicSocialMediaFacebook();
    //getSettingSpicSocialMediaYouTube();
    //getSettingSpicSocialMediaInstagram();
    getSettingSpicSocialMediaWhatapp();
    getSettingSpicSocialMediaTelgram();
    // getDeviceDetails();
    getSettingPrivasyPolicy();
    getSettingAmount();
    getSettingAbout();
    getSettingTerms();
    // rr();
    // getCity(0);
  }

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
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    margin: EdgeInsets.only(
                        bottom: 10, right: 30, left: 30, top: 10),
                    child: RaisedButton(
                      color: MyColors.color2,
                      elevation: 10,
                      splashColor: MyColors.color3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: MyColors.color1, width: 2)),
                      onPressed: () {
                        // Navigator.of(context).pushNamed("login");
                        dialogPrivicy(context);
                      },
                      child: Text(
                        "Creat an Account".tr,
                        style: TextStyle(
                            fontSize: 13,
                            color: MyColors.color3,
                            fontFamily: 'Almarai'),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: buttonStart(MyColors.color1, MyColors.color1,
                      "Login".tr, MyColors.color3, context, "oldLogin"),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => new gaust()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text("Guest".tr,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff707070),
                            fontFamily: 'Almarai')),
                  ),
                )
              ],
            ) /* add child content here */,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("terms");
                    },
                    child: Text(
                      "You are agreeing to our terms of service".tr,
                      style: TextStyle(
                          fontSize: 11,
                          color: MyColors.color1,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("privecy");
                    },
                    child: Text(
                      "and privacy plicy".tr,
                      style: TextStyle(
                          fontSize: 11,
                          color: MyColors.color1,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dialogPrivicy(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Terms".tr,
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 10,
                  ),
                  Text(term.toString(),
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 13,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 10,
                  ),
                  Text("You are agreeing to our terms of service".tr,
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: MyColors.color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        child: Text("ok".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("login");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        color: Color.fromARGB(255, 231, 38, 64),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: Color.fromARGB(255, 231, 38, 64),
                                width: 2)),
                        child: Text("cancle".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
