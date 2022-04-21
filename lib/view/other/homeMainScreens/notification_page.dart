import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelSetting/GetNotification.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class notificationPage extends StatefulWidget {
  notificationPage({Key? key}) : super(key: key);

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  homecontroller controller = Get.put(homecontroller());
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateNotif();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.color2,
          title: Text("Notifiction".tr,
              style: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Almarai')),
        ),
        body: Stack(
          children: [
            containerMaine(),
            Container(
              decoration: boxDecorationMain(),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: notifmap.length,
                itemBuilder: (context, index) {
                  int itemCount = notifmap.length;
                  int reversedIndex = itemCount - 1 - index;
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 2, bottom: 2),
                    child: ClipRRect(
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: notifmap[reversedIndex]
                                              ["notificationImage"] ==
                                          null
                                      ? Image.network(
                                          ("https://us.123rf.com/450wm/llesia/llesia2110/llesia211000042/176329767-notification-bell-icon-3d-render-yellow-ringing-bell-with-new-notification-for-social-media-reminder.jpg?ver=6"),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          ("http://212.24.108.54/wsaAdmin/images/${notifmap[reversedIndex]["notificationImage"]}"),
                                          fit: BoxFit.cover,
                                        )),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(4.0),
                                ),
                              ),
                              width: 70,
                              height: 73,
                            ),

                            SizedBox(width: 10),
                            Expanded(
                              child: ListTile(
                                title: Text(notifmap[reversedIndex]["title"],
                                    style: TextStyle(
                                        color: MyColors.color2,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Almarai')),
                                subtitle: Text(notifmap[reversedIndex]["body"],
                                    style: TextStyle(
                                        color: MyColors.color2,
                                        fontSize: 11,
                                        fontFamily: 'Almarai')),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                    notifmap[reversedIndex]["date"]
                                        .substring(0, 10),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        fontFamily: 'Almarai')),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 124, 130, 239),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  bottomLeft: Radius.circular(4.0),
                                ),
                              ),
                              width: 40,
                              height: 73,
                            ),

                            //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
