import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/modelquestinWinner.dart';

List<Map> winnerQustion = [];
Future getWinnerQustion() async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request('GET',
      Uri.parse('http://212.24.108.54/wsa/api/commonQuestion/winnerQuestion'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  modelQuestionWinner c = modelQuestionWinner.fromJson(jsonDecode(res.body));

  print(c.isSuccess);
  print("==============================");
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data.length; i++) {
        winnerQustion.add(c.data[i].toJson());
      }
      controller.SaveListWinnerQuestion(winnerQustion);
    } else {
      print(response.reasonPhrase);
    }
  }
}
