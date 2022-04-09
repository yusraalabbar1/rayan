import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/numberNotif.dart';

Future<int> getNumberOfNotificationServices(String deciveId) async {
  final String _baseUrl = Uri.encodeFull(
      "http://212.24.108.54/wsa/api/notification/GetNumberOfNotification?deviceId=${deciveId}");

  var response = await http.get(Uri.parse(_baseUrl));
  if (response.statusCode == 200) {
    NumberOfNotification numberOfNotification =
        NumberOfNotification.fromJson(json.decode(response.body));
    return numberOfNotification.data.notificationCount;
  } else {
    return 0;
  }
}
