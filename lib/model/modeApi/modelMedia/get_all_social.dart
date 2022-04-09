import 'dart:convert';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelMedia/add_user_media.dart';
import 'package:rayan/model/modeApi/modelPorfile/update_user_media.dart';
import 'package:rayan/model/modelJson/get_lookup_value.dart';
import 'package:rayan/utils/constant/url.dart';

List<Map> myJsonSocialAll = [];
List<Map> UserSocialMedi = [];
List<Map> UserSocialMediaValues = [];
var idSocial;
getAllSocialMidea(code, value, mark) async {
  final response = await http.get(Uri.parse(socialAll));
  getLookUpValue c = getLookUpValue.fromJson(jsonDecode(response.body));

  if (response.statusCode == 200) {
    for (var i = 0; i < c.data!.length; i++) {
      myJsonSocialAll.add(c.data![i].toJson());
    }
    print("===========getAllSocialMidea=============");
    print(myJsonSocialAll);
    print("\n");
    print(myJsonSocialAll.runtimeType);
    for (var i = 0; i < myJsonSocialAll.length; i++) {
      if (myJsonSocialAll[i]["lookupCode"] == "CompetitionSocialMedia") {
        print(myJsonSocialAll[i]["lookupCode"]);
        print(myJsonSocialAll[i]["id"]);
        print("\n");
        print(myJsonSocialAll[i]["values"]);
        print("\n");
      } else if (myJsonSocialAll[i]["lookupCode"] == "UserSocialMedia") {
        print(myJsonSocialAll[i]["lookupCode"]);
        print(myJsonSocialAll[i]["id"]);
        print("\n");
        print(myJsonSocialAll[i]["values"]);
        print("\n");

        // print(myJsonSocialAll[i]["values"][0][id]);
        // print(myJsonSocialAll[i]["values"][0][code]);

        for (var j = 0; j < myJsonSocialAll[i]["values"].length; j++) {
          if (myJsonSocialAll[i]["values"][j]["code"] == code) {
            print("found type.......");
            idSocial = myJsonSocialAll[i]["values"][j]["id"];
            print(idSocial);
            print(value);
            if (mark == 0) {
              //add link
              print("add link");
              addUserMedia(value, idSocial);
            } else {
              //update link
              print("update link");
              updaeUserMedia(idSocial, value);
            }

            //getUserProfilWithMedia();
            break;
          } else {
            print("not found yet");
          }
        }
      } else {
        print("not found social");
      }
    }
  } else {
    throw Exception('Failed to load country');
  }
}
