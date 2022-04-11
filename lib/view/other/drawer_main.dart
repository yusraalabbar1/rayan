import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/view/auth/page/start_page.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelPorfile/update_codeMarket.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/other/setting/profile/dialogMedia.dart';
import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

final String _content =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

void _shareContent() {
  Share.share(_content);
}

Widget drawerMain(context) {
  return Container(
    color: Color(0xff1A1E2B),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GetBuilder<homecontroller>(builder: (controller) {
            return (Container(
              alignment: Alignment.topRight,
              width: 44,
              height: 44,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: MyColors.color1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (controller.savePathImage == null)
                      ? Icon(Icons.image_not_supported)
                      : Image.network(
                          controller.savePathImage,
                          width: 44,
                          height: 44,
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),
            ));
          }),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(firstNamepref == null ? "name1" : firstNamepref,
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'Almarai')),
          ),
          Text(usernamepref == null ? "users@gmail" : usernamepref,
              style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 10,
                  fontFamily: 'Almarai')),
          InkWell(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("الملف الشخصي",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed("sittingProfile");
            },
          ),
          // InkWell(
          //   child: Row(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.all(10),
          //         child: Icon(
          //           Icons.notifications,
          //           size: 20,
          //           color: Colors.white,
          //         ),
          //       ),
          //       Container(
          //           child: Text("الإشعارات ",
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 14,
          //                   fontFamily: 'Almarai')))
          //     ],
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pushNamed("sittingNotification");
          //   },
          // ),
          InkWell(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.lock,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("الأمان والخصوصية",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed("sittingSecurity");
            },
          ),
          InkWell(
            onTap: () {
              dialogForCode(context);
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.code,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("الكود التسويقي",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("question");
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.question_answer,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("الأسئلة الشائعة",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // launch("00221778821171");
              dialogForMediae(context);
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.contact_page,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("تواصل معنا ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: InkWell(
              onTap: () {
                _shareContent;
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.share,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      child: Text("مشاركة",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Almarai')))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("terms");
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add_moderator,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      child: Text("الشروط والاحكام",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Almarai')))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("about");
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.person_pin_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      child: Text("من نحن",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Almarai')))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              SharedPreferences presIsLogin =
                  await SharedPreferences.getInstance();
              presIsLogin.setBool("isLogin", false);
              navigator!.pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => startPage()));
              // SystemNavigator.pop();
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("تسجيل الخروج",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

GlobalKey<FormState> formstate = new GlobalKey<FormState>();
homecontroller controller = Get.find();
dialogForCode(context) {
  var codeMarket;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
              key: formstate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                          text: controller.savemarketingCodeeSavepref));
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.copy,
                            size: 20,
                            color: MyColors.color1,
                          ),
                        ),
                        Container(
                            child: Text(" نسخ الكود التسويقي ",
                                style: TextStyle(
                                    color: MyColors.color2,
                                    fontSize: 14,
                                    fontFamily: 'Almarai'))),
                        Text(controller.savemarketingCodeeSavepref,
                            style: TextStyle(
                                color: MyColors.color2,
                                fontSize: 14,
                                fontFamily: 'Almarai')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("هل تريد اجراء تعديل على الكود التسويقي?",
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 13,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 30,
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (TextFormField(
                      style: TextStyle(
                          color: MyColors.color3,
                          fontFamily: 'Almarai',
                          fontSize: 10),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(),
                      validator: (text) {
                        if (text!.length > 40) {
                          return "can not enter bigest than 15";
                        }
                        if (text.length < 2) {
                          return "can not enter less than 2";
                        }
                        return null;
                      },
                      onSaved: (string) {
                        print("on saved");
                        codeMarket = string;
                        controller.SavemarketingCodeeSavepref(codeMarket);
                      },
                    ));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: MyColors.color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        child: Text("موافق",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            print("valid");
                            updateCodeMarketing(codeMarket, context);
                            Navigator.of(context).pop();
                          }
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
                        child: Text("إلغاء",
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
              )),
        );
      });
}
