import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/modelCommissionBalance.dart';
import 'package:rayan/model/modelJson/userBalanceModel.dart';
import 'package:rayan/model/modelJson/userBalancmodelLog.dart';
import 'package:rayan/utils/constant/url.dart';

var balancecommission;
Future comissionBalanc() async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request(
      'GET',
      Uri.parse(
          URL_BASE + '/user/userCommissionBalances?UserId=${idSaveprefpref}'));
  request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  if (res.body.isNotEmpty) {
    modellComissionBalance c =
        modellComissionBalance.fromJson(jsonDecode(res.body));
    print("==============================");
    print(c.isSuccess);
    print("==============================");
    if (response.statusCode == 200) {
      if (c.isSuccess == true) {
        balancecommission = c.data!.commissionBalance;
        print(c.data!.commissionBalance);
      } else {}
    } else {
      print(response.reasonPhrase);
    }
  } else {
    print("obj empty");
  }
}
