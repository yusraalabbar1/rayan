import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/rechargeBalanceFromUserToUserModel.dart';
import 'package:rayan/utils/constant/color.dart';

Future rechargeBalanceFromUserToUser(context, unique, balanc) async {
  var headers = {
    'Authorization': "Bearer $tokenloginresult",
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse('http://212.24.108.54/wsa/api/user/rechargeToUser'));
  request.body = json.encode(
      {"UserId": idSaveprefpref, "ToUniqueCode": unique, "Balance": balanc});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  rechargeBalanceFromUserToUserModel c =
      rechargeBalanceFromUserToUserModel.fromJson(jsonDecode(res.body));
  print(c.isSuccess);
  print(c.message);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              body: Text("تم الارسال",
                  style: TextStyle(
                      color: MyColors.color3,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    } else {
      if (c.message == "Not_Available_Balance") {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                btnOkOnPress: () {},
                body: Text("ليس لديك رصيد كاف",
                    style: TextStyle(
                        color: MyColors.color3,
                        fontSize: 14,
                        fontFamily: 'Almarai')),
                dialogBackgroundColor: MyColors.color2,
                btnOkColor: MyColors.color1)
            .show();
      } else if (c.message == "Code_Not_Correct") {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                btnOkOnPress: () {},
                body: Text("الكود المدخل غير صحيح",
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
                dialogType: DialogType.INFO,
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
    }
  } else {
    print(response.reasonPhrase);
  }
}
