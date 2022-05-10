import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/allMamberForCompitition.dart';
import 'package:rayan/model/modelJson/model_agent.dart';
import 'package:rayan/utils/constant/url.dart';
import 'package:rayan/view/other/agentsScreens/agents_main.dart';

var lengthMemberComp;
List<Map> memberInCompt = [];
var idVotMember;
Future allMemberCompitition(id) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request(
      'GET', Uri.parse(URL_BASE + '/Competitions/competitionMember/$id'));
  request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  getAllCompitionMember c =
      getAllCompitionMember.fromJson(jsonDecode(res.body));
  print("==============getAllCompitionMember================");
  print(id);
  print(c.isSuccess);
  lengthMemberComp = c.data.length;
  print(lengthMemberComp);
  for (var i = 0; i < lengthMemberComp; i++) {
    memberInCompt.add(c.data[i].toJson());
  }
  print(memberInCompt);
  controller.SavememberInCompt(memberInCompt);
  controller.SavememberInComptlength(memberInCompt.length);
  print("==============================");
  if (response.statusCode == 200) {
  } else {
    print(response.reasonPhrase);
  }
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
