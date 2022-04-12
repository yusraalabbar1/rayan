import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/compitition.dart';
import 'package:rayan/utils/constant/url.dart';

List<Map> MyCompitition = [];
List<Map> foundCompitition = [];
var day, hour, min, sec;
Future allCompititionapi() async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenloginresult"
  };
  var request = http.Request('GET', Uri.parse(all_compitition));
  request.body = '''''';
  request.headers.addAll(headers);
  final response = await http.get(Uri.parse(all_compitition));
  comititionModel c = comititionModel.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    for (var i = 0; i < c.data.length; i++) {
      MyCompitition.add(c.data[i].toJson());
    }
    controller.SaveMapCompitition(MyCompitition);
    foundCompitition = MyCompitition;
    print("===========allCompitition=============");
    print(MyCompitition);
    print(MyCompitition.runtimeType);
    print("===========endCompitition=============");
  } else {
    print(response.reasonPhrase);
  }
}
