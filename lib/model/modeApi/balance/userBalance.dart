import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modelJson/userBalanceModel.dart';
import 'package:rayan/model/modelJson/userBalancmodelLog.dart';
import 'package:rayan/utils/constant/url.dart';

var balanceForUser;
Future userBalanc() async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Authorization': "Bearer $tokenloginresult"};
  var request = http.Request('GET',
      Uri.parse(URL_BASE + '/user/userBalances?UserId=${idSaveprefpref}'));
  request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  if (res.body.isNotEmpty) {
    userBalanceModel c = userBalanceModel.fromJson(jsonDecode(res.body));
    print("==============================");
    print(c.isSuccess);
    print("==============================");
    if (response.statusCode == 200) {
      if (c.isSuccess == true) {
        balanceForUser = c.data!.balances;

        controller.SavebalanceForUser(balanceForUser);
        print(c.data!.balances);
      } else {}
    } else {
      print(response.reasonPhrase);
    }
  } else {
    print("obj empty");
  }
}


/*

class BalanceBloc {
  StreamController<userBalanceModel> streamresponse =
      StreamController<userBalanceModel>();
  userBalanc() async {
    final res = await HttpRequest().callRequest(
        requestType: REQUEST_TYPE.get,
        methodName: "/user/userBalances?UserId=${idSaveprefpref}");
    streamresponse.sink.add(userBalanceModel.fromJson(res));
  }
}


/

*/