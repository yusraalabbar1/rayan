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

List<Map> notifmap = [];
Future GetNotification(idDevice) async {
  homecontroller controller = Get.put(homecontroller());
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
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/notification/GetNotification?deviceId=${idDevice}'));
  request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  allNotificaion c = allNotificaion.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    for (var i = 0; i < c.data!.length; i++) {
      notifmap.add(c.data![i].toJson());
      print("===========allNotifi=============");
      print(c.data![i].toJson());
      print(notifmap);
      print(notifmap.runtimeType);
    }
    controller.SaveListNotifications(notifmap);
  } else {
    print(response.reasonPhrase);
  }
}
