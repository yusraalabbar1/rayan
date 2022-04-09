import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/modelGetComptitionMemWiner.dart';
import 'package:rayan/model/modelJson/modelGetWinner.dart';
import 'package:rayan/utils/constant/url.dart';

Future getComptWinner(tokenloginresult, idcopmtition) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Authorization': 'Bearer ${tokenloginresult}'};
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/Competitions/getCompetitionWinner/${idcopmtition}'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  modelComWinner c = modelComWinner.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    print("''''''''''''''''''''''''''''''");
    print(idcopmtition);
    print(c.data?.nickName);
    print(c.data?.voteNumber);
    print(c.data?.id);
    controller.SavegetComptWinnerNickName(c.data?.nickName);
    controller.SavegetComptWinnerNumbeVote(c.data?.voteNumber);
    controller.SavegetComptWinnerid(c.data?.id);

    print("''''''''''''''''''''''''''''''");
  } else {
    print(response.reasonPhrase);
  }
}
