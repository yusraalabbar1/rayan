import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/updateMarketCode.dart';
import 'package:rayan/utils/constant/color.dart';

Future updateCodeMarketing(code, context) async {
  var headers = {
    'Authorization': "Bearer $tokenloginresult",
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST',
      Uri.parse('http://212.24.108.54/wsa/api/user/updateMarketingCode'));
  request.body = json.encode({"UserId": idSaveprefpref, "MarketingCode": code});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  updateMarketCode c = updateMarketCode.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess) {
      print("trueeeeeeeeeeeeee");
    } else {
      print("falseeeeee");
    }
    // print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
