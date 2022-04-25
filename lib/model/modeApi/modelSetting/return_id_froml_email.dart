import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modelJson/model_id_from_email.dart';
import 'package:rayan/utils/constant/color.dart';

var idUserFromEmail;
homecontroller controller = Get.put(homecontroller());
Future getUserIdFromEmail(email, context) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://212.24.108.54/wsa/api/user/newOtp'));
  request.body = json.encode({"UserName": email});
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  idFromEmail c = idFromEmail.fromJson(jsonDecode(res.body));
  print(c.isSuccess);
  print("==============================");
  if (response.statusCode == 200) {
    idUserFromEmail = c.data.userId;
    print(idUserFromEmail);
    if (c.isSuccess == true) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              btnOkOnPress: () {
                Navigator.of(context).pushNamed("passwordNew");
              },
              body: Text(
                  'اسم المستخدم صحيح حاليا ادخل كلمة المرور الجديدة.. حاليا اضغط على موافق للاستمرار',
                  style: TextStyle(
                      color: MyColors.color3,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    } else {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'خطأ',
              btnOkOnPress: () {},
              body: Text(" خطأ في اسم المستخدم!! ",
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
