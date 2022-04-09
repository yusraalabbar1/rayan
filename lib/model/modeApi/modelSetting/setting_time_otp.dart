import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/result_setting_model.dart';
import 'package:rayan/utils/constant/url.dart';

var timeSettingOtp;
getSettingSpictimeOtp() async {
  var request = http.Request('GET', Uri.parse(otp_time));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    timeSettingOtp = c.data[0].toJson()["value"];
    print(timeSettingOtp);
  } else {
    print(response.reasonPhrase);
  }
}
