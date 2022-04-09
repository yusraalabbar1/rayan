import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/model_agent.dart';
import 'package:rayan/utils/constant/url.dart';
import 'package:rayan/view/other/agentsScreens/agents_main.dart';

var isSuc;
List<Map> allAgent = [];

List<Map> foundAll = [];
Future getAllAgents(tokenloginresult, countryIdSaveprf, cityIdSavepref) async {
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request(
      'GET',
      Uri.parse(
          "http://212.24.108.54/wsa/api/agent/filter-agent?countryId=${countryIdSaveprf}&cityId=${cityIdSavepref}"));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  Agent c = Agent.fromJson(jsonDecode(res.body));
  print("***************************");
  for (var i = 0; i < c.data.length; i++) {
    allAgent.add(c.data[i].toJson());
    print(c.data[i].toJson());
  }
  foundAll = allAgent;

  print("*************allAgent**************");
  print(allAgent);
  if (response.statusCode == 200) {
    //print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
