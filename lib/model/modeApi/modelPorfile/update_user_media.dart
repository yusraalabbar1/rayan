import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/utils/constant/url.dart';

Future updaeUserMedia(id, value) async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request =
      http.Request('POST', Uri.parse(URL_BASE + '/user/updateUserMedia'));
  request.body = json.encode({id, value});
  request.headers.addAll(headers);
//controller
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
