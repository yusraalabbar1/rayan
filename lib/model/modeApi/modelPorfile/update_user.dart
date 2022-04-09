import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:http/http.dart' as http;

Future updateUser(first, mid, last) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request = http.Request(
      'POST', Uri.parse('http://212.24.108.54/wsa/api/user/updateUserInfo'));
  request.body = json.encode({
    "UserId": idSaveprefpref,
    "FirstName": first,
    "MidName": mid,
    "LastName": last
  });
  controller.SaveFirstName(first);
  controller.SaveMidName(mid);
  controller.SaveLastName(last);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
