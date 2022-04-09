import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/userBalanceModel.dart';
import 'package:rayan/model/modelJson/userBalancmodelLog.dart';

var balanceForUser;
Future userBalanc() async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/user/userBalances?UserId=${idSaveprefpref}'));
  request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  userBalanceModel c = userBalanceModel.fromJson(jsonDecode(res.body));
  print("==============================");
  print(c.isSuccess);
  print("==============================");
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      balanceForUser = c.data.balances;
      controller.SavebalanceForUser(balanceForUser);
      print(c.data.balances);
    } else {}
  } else {
    print(response.reasonPhrase);
  }
}
