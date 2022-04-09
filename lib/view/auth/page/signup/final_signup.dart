import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelSignUp/send_inf_signup.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:http/http.dart' as http;

class finalLogin extends StatefulWidget {
  finalLogin({Key? key}) : super(key: key);

  @override
  State<finalLogin> createState() => _finalLoginState();
}

class _finalLoginState extends State<finalLogin> {
  bool isChecked = false;

  homecontroller controller = Get.put(homecontroller());
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var username;
  var password;
  String identifier = "";
  bool _isObscure = true;
  Future getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        identifier = build.androidId!; //UUID for Android
        controller.SaveDeviceId(identifier);
        print("*********androidId********");
        print(identifier);
        print("*********identifier********");
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor!; //UUID for iOS
        controller.SaveDeviceId(identifier);
        print("*********isIOS********");
        print(identifier);
        print("*********identifier********");
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  FocusNode myFocusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controller.saveCountryCode);
    print(controller.saveCountryCode);
    print(controller.saveCountryid);
    print(controller.saveEmail);
    print(controller.saveFirstName);
    print(controller.saveLastName);
    print(controller.saveMidName);
    print(controller.saveNumberPhone);
    print(controller.savecityId);
    //sendIpToken();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return MyColors.color1;
      }
      return Colors.black;
    }

    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  wstContainer(context),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 50, bottom: 10),
                    child: Text(
                      "Super, you have done all the steps".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 30, right: 50, bottom: 10),
                    child: Text(
                      "Let's choose the User and Password".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "User Name".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        style: TextStyle(color: MyColors.color3),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '',
                        ),
                        onChanged: (value) {
                          // do something
                        },
                        validator: (text) {
                          if (text!.length > 40) {
                            return "can not enter bigest than 40";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                          return null;
                        },
                        onSaved: (string) {
                          print("on saved");
                          username = string;
                          controller.SaveUserName(string);
                        },
                      ));
                    })),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Pass Word".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        style: TextStyle(color: MyColors.color3),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color(0xffFAB10C)
                                  : Colors.black),
                        ),
                        validator: (text) {
                          if (text!.length > 40) {
                            return "can not enter bigest than 40";
                          }
                          if (text.length < 5) {
                            return "can not enter less than 5";
                          }
                          return null;
                        },
                        onSaved: (string) {
                          print("on saved");
                          password = string;
                          controller.SavePassWord(string);
                        },
                      ));
                    })),
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      margin: EdgeInsets.only(
                          bottom: 10, right: 30, left: 30, top: 10),
                      child: RaisedButton(
                        color: MyColors.color1,
                        elevation: 10,
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        onPressed: () async {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            controller.userName;
                            controller.passWord;
                            send_inf_signup(
                                controller.userName,
                                controller.passWord,
                                controller.saveFirstName,
                                controller.saveMidName,
                                controller.saveLastName,
                                controller.saveCountryid,
                                controller.savecityId,
                                controller.saveNumberPhone,
                                controller.saveCodeMarkting,
                                controller.devicIdsave,
                                context);
                          }
                        },
                        child: Text(
                          "Register now".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
