import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rayan/model/modelJson/result_setting_model.dart';
import 'package:rayan/utils/constant/url.dart';

var facebookSitting = "";
var youtubeSitting = "";
var instagramSitting = "";
var whatsupSitting = "";
var telgramSitting = "";
var amountSitting;
var Privacy = "";
var term = "";
var aboutUs = "";
var twitterSitting = "";

getSettingAbout() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          "http://212.24.108.54/wsa/api/setting?settingName=setting.aboutus"));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    aboutUs = c.data[0].toJson()["value"];
    print(aboutUs);
  } else {
    print(response.reasonPhrase);
  }
}

getSettingTerms() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          "http://212.24.108.54/wsa/api/setting?settingName=setting.terms"));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    term = c.data[0].toJson()["value"];
    print(term);
  } else {
    print(response.reasonPhrase);
  }
}

getSettingAmount() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          "http://212.24.108.54/wsa/api/setting?settingName=setting.extra.vote.amount"));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    amountSitting = c.data[0].toJson()["value"];
    print(amountSitting);
  } else {
    print(response.reasonPhrase);
  }
}

getSettingSpicSocialMediatwitter() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          "http://212.24.108.54/wsa/api/setting?settingName=setting.twitter"));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    twitterSitting = c.data[0].toJson()["value"];
    print(twitterSitting);
  } else {
    print(response.reasonPhrase);
  }
}
// getSettingSpicSocialMediaFacebook() async {
//   var request = http.Request('GET', Uri.parse(url_social_media));

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     var res = await http.Response.fromStream(response);
//     setting c = setting.fromJson(jsonDecode(res.body));
//     facebookSitting = c.data[0].toJson()["value"];
//     print(facebookSitting);
//   } else {
//     print(response.reasonPhrase);
//   }
// }
/*
getSettingSpicSocialMediaYouTube() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/setting?settingName=setting.youtube'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    youtubeSitting = c.data[0].toJson()["value"];
    print(youtubeSitting);
  } else {
    print(response.reasonPhrase);
  }
}

getSettingSpicSocialMediaInstagram() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/setting?settingName=setting.Instagram'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    instagramSitting = c.data[0].toJson()["value"];
    print(instagramSitting);
  } else {
    print(response.reasonPhrase);
  }
}*/

getSettingSpicSocialMediaWhatapp() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/setting?settingName=setting.whatsup'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    whatsupSitting = c.data[0].toJson()["value"];
    print(whatsupSitting);
  } else {
    print(response.reasonPhrase);
  }
}

getSettingSpicSocialMediaTelgram() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/setting?settingName=setting.whatsup'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    telgramSitting = c.data[0].toJson()["value"];
    print(telgramSitting);
  } else {
    print(response.reasonPhrase);
  }
}

getSettingPrivasyPolicy() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://212.24.108.54/wsa/api/setting?settingName=setting.privacy'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await http.Response.fromStream(response);
    setting c = setting.fromJson(jsonDecode(res.body));
    Privacy = c.data[0].toJson()["value"];
    print(Privacy);
  } else {
    print(response.reasonPhrase);
  }
}
