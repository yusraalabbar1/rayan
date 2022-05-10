import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/addMember.dart';
import 'package:rayan/model/modelJson/modelAgentDetails.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/utils/constant/url.dart';

var imagesAgents = [];
List<Map> mediaAgents = [];
Future agentDetails(id) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request = http.Request('GET', Uri.parse(URL_BASE + '/agent/details/$id'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  modelAgentsDetails c = modelAgentsDetails.fromJson(jsonDecode(res.body));

  print("==============================");
  if (response.statusCode == 200) {
    for (var k in c.data.agentImages) {
      imagesAgents.add(k.imageUrl);
    }
    controller.SaveImagesAgents(imagesAgents);
    print(imagesAgents);
    for (var k in c.data.agentMedia) {
      mediaAgents.add(k.toJson());
    }
    controller.SaveMediaAgents(mediaAgents);
    print(mediaAgents);
  } else {
    print(response.reasonPhrase);
  }
}
