import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/addMember.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/utils/constant/url.dart';

// List<Map> addMemberComp = [];

Future addMemberCompitition(context, nick) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'http://212.24.108.54/wsa/api/Competitions/addCompetitionMember'));
  request.body = json.encode({
    "CompetitionId": controller.saveidComp,
    "UserId": idSaveprefpref,
    "NickName": nick
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  AddMember c = AddMember.fromJson(jsonDecode(res.body));

  print("==============================");
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      AddMemberData d = AddMemberData.fromJson(jsonDecode(res.body));
      controller.SaveMemberIdCompt(d.data.memberNo);
      Navigator.of(context).pushReplacementNamed("completPersonSub");
    } else {
      if (c.message == "Already_Register") {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                btnOkOnPress: () {},
                body: Text("Already Register".tr,
                    style: TextStyle(
                        color: MyColors.color3,
                        fontSize: 14,
                        fontFamily: 'Almarai')),
                dialogBackgroundColor: MyColors.color2,
                btnOkColor: MyColors.color1)
            .show();
      } else if (c.message == "Not_Available_Balance") {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                btnOkOnPress: () {},
                body: Text("Not Available Balance".tr,
                    style: TextStyle(
                        color: MyColors.color3,
                        fontSize: 14,
                        fontFamily: 'Almarai')),
                dialogBackgroundColor: MyColors.color2,
                btnOkColor: MyColors.color1)
            .show();
      } else if (c.message == "Max_Member_Of_Competition") {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                btnOkOnPress: () {},
                body: Text("تم الوصول للحد الأقصى للعدد",
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
                desc: c.message,
                btnOkOnPress: () {},
                btnOkIcon: Icons.cancel,
                dialogBackgroundColor: MyColors.color2,
                btnOkColor: MyColors.color1)
            .show();
      }
    }
  } else {
    AwesomeDialog(
            context: context,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            desc: c.message,
            btnOkOnPress: () {},
            btnOkColor: MyColors.color1)
        .show();
    print(response.reasonPhrase);
  }
}
