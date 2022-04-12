import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelSetting/GetNotification.dart';
import 'package:rayan/model/modeApi/modelSetting/model_numberNoti.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/model/modeApi/modelsCompt/getWinner.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/homeMainScreens/widget_balance.dart';
import 'package:rayan/view/other/homeMainScreens/widget_gallary.dart';
import 'package:rayan/view/other/homeMainScreens/widget_home.dart';
import 'package:rayan/view/other/homeMainScreens/widget_winner.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/model_agent.dart';
import 'package:rayan/model/modelJson/model_all_notifications.dart';
import 'package:rayan/utils/constant/url.dart';
import 'package:rayan/view/other/agentsScreens/agents_main.dart';

class homeMain extends StatefulWidget {
  homeMain({Key? key}) : super(key: key);

  @override
  State<homeMain> createState() => _homeMainState();
}

class _homeMainState extends State<homeMain> {
  Future updateNotif() async {
    var identifier;
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
    var headers = {'Authorization': ' Bearer $tokenloginresult'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://212.24.108.54/wsa/api/notification/UpdateNotification?deviceId=${identifier}'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  homecontroller controller = Get.put(homecontroller());
  int numberOfNotification = 0;
  String identifier = "";
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> getNumberOfNotification() async {
    // get deviceid
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId!;
    } else {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      identifier = iosInfo.identifierForVendor!;
    }

    int result = await getNumberOfNotificationServices(identifier);
    if (numberOfNotification != result) {
      setState(() {
        numberOfNotification = result;
      });
    }
  }

  String FormatDate(DateTime _dateTime) {
    return "${_dateTime.day}/${_dateTime.month}/${_dateTime.year} ${_dateTime.hour}:${_dateTime.minute}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //getNumberOfNotificationServices(identifier);
  }

  @override
  Widget build(BuildContext context) {
    getNumberOfNotification();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      InkWell(
                        child:
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
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ));
                        }),
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          dropdownWidth: 193,
                          dropdownMaxHeight: 190,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff1C2948),
                            boxShadow: [
                              BoxShadow(spreadRadius: 0.8),
                            ],
                          ),
                          customButton: Stack(
                            alignment: Alignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateNotif();
                                  // GetNotification();
                                },
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Visibility(
                                  visible:
                                      (numberOfNotification > 0 ? true : false),
                                  child: Positioned(
                                    top: 5,
                                    right: 2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${numberOfNotification.toString()}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          //  Icon(
                          //   Icons.notifications,
                          //   size: 35,
                          //   color: Colors.white,
                          // ),
                          items: controller.saveListNotifications.reversed
                              .map((Map map) {
                            return DropdownMenuItem<String>(
                              value: map["id"].toString(),
                              child: Column(
                                children: [
                                  Text(
                                    map["title"].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontFamily: 'Almarai'),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    map["body"].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 7,
                                        fontFamily: 'Almarai'),
                                    maxLines: 1,
                                  ),
                                  // leading: Icon(
                                  //   Icons.notifications_active,
                                  //   color: MyColors.color1,
                                  // ),

                                  SizedBox(
                                    height: 3,
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
                logoContainer(context),
              ],
            ),
            widgetBalance(context),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Text(
                "Competitions".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'Almarai'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            widgetgallary(context),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Winners".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'Almarai'),
              ),
            ),
            widetWinner(context)
          ],
        )
      ],
    ));
  }
}
