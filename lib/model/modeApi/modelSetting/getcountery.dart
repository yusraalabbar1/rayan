import 'dart:convert';
import 'package:country_state_city_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/Country_model.dart';
import 'package:rayan/utils/constant/url.dart';

List<Map> myJsonCountry = [];
List<Map> myJsonCity = [];
List listCity = [];
Future getCoutery() async {
  // List<Map> myJsonCountry = [];
  String url = url_get_country;
  final response = await http.get(Uri.parse(url));
  Country c = Country.fromJson(jsonDecode(response.body));

  if (response.statusCode == 200) {
    for (var i = 0; i < c.data.length; i++) {
      myJsonCountry.add(c.data[i].toJson());
      print("===========country=============");
      print(c.data[i].toJson());
      print(myJsonCountry);
      print(myJsonCountry.runtimeType);
    }
  } else {
    throw Exception('Failed to load country');
  }
}

Future getCity(int j) async {
  // List<Map> myJsonCity = [];
  for (var i = 0; i < myJsonCountry[j]["cities"].length; i++) {
    myJsonCity.add(myJsonCountry[j]["cities"][i]);
  }
  print("===========cities=============");
  print(myJsonCity);
  print("========================");

  print(myJsonCity.runtimeType);
  print("========================");
}
