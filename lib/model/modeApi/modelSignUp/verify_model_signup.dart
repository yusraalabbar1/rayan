import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/modelVerifOtp.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/utils/constant/url.dart';

verifyModel(userId, otp, context) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(otp_verify_signup));
  request.body = json.encode({"UserId": userId, "Otp": otp.toString()});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  modelVerifyOtp c = modelVerifyOtp.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print("OTP Verified!!");
      send_inf_login(controller.userName, controller.passWord, context);
      //Navigator.of(context).popAndPushNamed("welcom");
    } else {
      AwesomeDialog(
              context: context,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {},
              body: Text(c.message,
                  style: TextStyle(
                      color: MyColors.color3,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    }
  } else {
    print(response.reasonPhrase);
  }
}
