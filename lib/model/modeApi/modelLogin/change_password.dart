import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/utils/constant/url.dart';

Future changePasswordModel(useridForPassword, newPassWord, context) async {
  print(useridForPassword);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(url_change_password));
  request.body =
      json.encode({"UserId": useridForPassword, "NewPassword": newPassWord});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    Navigator.of(context).popAndPushNamed("oldLogin");
  } else {
    print(response.reasonPhrase);
  }
}
