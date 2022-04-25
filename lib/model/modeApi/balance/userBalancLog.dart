import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/userBalancmodelLog.dart';

List<Map> register = [];
List<Map> recived = [];
Future userBalancLog() async {
  homecontroller controller = Get.put(homecontroller());
  print("##########################################");
  print(idSaveprefpref);
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/user/getUserBalanceLogs?UserId=${idSaveprefpref}'));
  request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  if (res.body.isNotEmpty) {
    userBalanceLogModel c = userBalanceLogModel.fromJson(jsonDecode(res.body));
    print("==============================");
    print(c.isSuccess);
    print("==============================");
    if (response.statusCode == 200) {
      if (c.isSuccess == true) {
        for (var i = 0; i < c.data!.length; i++) {
          if (c.data![i].code == "Recive") {
            recived.add(c.data![i].toJson());
          } else {
            register.add(c.data![i].toJson());
          }
        }

        // print(register);
        controller.SaverecivedLog(recived);
        controller.SaveregisterLog(register);
        print("yesssssssssssssssssssss");
      } else {
        print("noooooooooooooooooooooo");
      }
    } else {
      print("falseeeeeeeeeeeeeeeeee");
      print(response.reasonPhrase);
    }
  } else {
    print("obj empty");
  }
}
