// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/model/modelJson/modeladdCompitationVote.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/utils/constant/url.dart';

Future addCompitationVote(idComp, memberId, userId, context) async {
  print(idComp);
  print(memberId);
  print(userId);
  var headers = {
    'Authorization': "Bearer $tokenloginresult",
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse(URL_BASE + '/Competitions/addCompetitionVote'));
  request.body = json.encode(
      {"CompetitionId": idComp, "MemberId": memberId, "UserId": userId});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  addCompitationVoteModel c =
      addCompitationVoteModel.fromJson(jsonDecode(res.body));
  print(c.isSuccess);
  print(c.message);

  if (response.statusCode == 200) {
    //  allMemberCompititionlength(idComp);
    memberInCompt = [];
    allMemberCompitition(idComp);
    if (c.isSuccess == true) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {},
              body: Text("تم التصويت",
                  style: TextStyle(
                      color: MyColors.color3,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    } else if (c.message == "User_Already_Vote") {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {
                extraAddCompitationVote(idComp, memberId, userId, context);
              },
              body: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    "أنت قد صووت من قبل. لكن يمكنك ان تصوت مقابل مبلغ" +
                        " " +
                        amountSitting.toString() +
                        "\$",
                    style: TextStyle(
                        color: MyColors.color3,
                        fontSize: 14,
                        fontFamily: 'Almarai')),
              ),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    } else {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              desc: c.message,
              btnOkOnPress: () {},
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    }
  } else {
    print(response.reasonPhrase);
  }
}

Future extraAddCompitationVote(idComp, memberId, userId, context) async {
  print(idComp);
  print(memberId);
  print(userId);
  var headers = {
    'Authorization': "Bearer $tokenloginresult",
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse(URL_BASE + '/Competitions/extraCompetitionVote'));
  request.body = json.encode(
      {"CompetitionId": idComp, "MemberId": memberId, "UserId": userId});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  addCompitationVoteModel c =
      addCompitationVoteModel.fromJson(jsonDecode(res.body));
  print(c.isSuccess);
  print(c.message);

  if (response.statusCode == 200) {
    memberInCompt = [];
    allMemberCompitition(idComp);
    print("vvvvvvvvvvvvvvv");
    print(c.isSuccess);
    print(c.message);
    if (c.isSuccess == true) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {},
              body: Text("Been voted".tr,
                  style: TextStyle(
                      color: MyColors.color3,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    } else if (c.message == "User_Not_Have_Balance") {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
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
    } else {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              desc: c.message,
              btnOkOnPress: () {},
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    }
  } else {
    print(response.reasonPhrase);
  }
}
