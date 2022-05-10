import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/model_agent.dart';
import 'package:rayan/model/modelJson/model_all_notifications.dart';
import 'package:rayan/utils/constant/url.dart';
import 'package:rayan/view/other/agentsScreens/agents_main.dart';

Future updateNotification() async {
  var headers = {'Authorization': 'Bearer  $tokenloginresult'};
  var request = http.Request('GET',
      Uri.parse(URL_BASE + '/notification/UpdateNotification?deviceId=test'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
