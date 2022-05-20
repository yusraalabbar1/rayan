import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/model_common_question.dart';
import 'package:rayan/utils/constant/url.dart';

List<Map> question = [];
Future commonQuestionsapi() async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request = http.Request('GET', Uri.parse(url_common_question));
  request.body = '''''';
  request.headers.addAll(headers);
  String url = url_common_question;
  final response = await http.get(Uri.parse(url));
  commonQuestions c = commonQuestions.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    for (var i = 0; i < c.data.length; i++) {
      question.add(c.data[i].toJson());
      print("===========allNotifi=============");
      print(c.data[i].toJson());
      print(question);
      print(question.runtimeType);
    }
  } else {
    print(response.reasonPhrase);
  }
}
