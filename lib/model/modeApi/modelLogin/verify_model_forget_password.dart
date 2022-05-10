import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelLogin/change_password.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelSetting/generate_otp.dart';
import 'package:rayan/model/modeApi/modelSignUp/send_inf_signup.dart';
import 'package:rayan/model/modelJson/modelGenerateOtp.dart';
import 'package:rayan/model/modelJson/modelVerifOtp.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/utils/constant/url.dart';

generate() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(URL_BASE + '/user/newOtp'));
  request.body = json.encode({"UserName": usernamepref});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  genrOtp c = genrOtp.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    //(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

verifyModelPassword(userId, otp, context, newPassWord) async {
  print("verifyModelPassword");
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(otp_verify_pass));
  request.body = json.encode({"UserId": userId, "Otp": otp.toString()});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  modelVerifyOtp c = modelVerifyOtp.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      changePasswordModel(userId, newPassWord, context);

      print("OTP Verified!!");
    }
  } else {
    // print(response.reasonPhrase);
  }
}
