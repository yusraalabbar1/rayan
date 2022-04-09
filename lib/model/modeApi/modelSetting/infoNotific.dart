import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';

Future infoNotification() async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request = http.Request(
      'POST', Uri.parse('http://212.24.108.54/wsa/api/user/addDeviceToken'));
  request.body =
      json.encode({"DeciveId": controller.devicIdsave, "Token": "test"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  print("=========device id===============");
  print(controller.devicIdsave);
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
