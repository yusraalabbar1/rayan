import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelMedia/get_all_social.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/get_lookup_value.dart';
import 'package:rayan/utils/constant/url.dart';

Future addUserMedia(value, id) async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request =
      http.Request('POST', Uri.parse(URL_BASE + '/user/addUserMedia'));
  request.body = json
      .encode({"UserId": idSaveprefpref, "MediaTypeId": id, "Value": value});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
//cotroller
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
