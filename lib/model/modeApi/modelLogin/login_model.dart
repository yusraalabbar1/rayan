import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/model/modeApi/modelSetting/GetNotification.dart';
import 'package:rayan/model/modeApi/modelsCompt/getWinnerQuestion.dart';
import 'package:rayan/model/modeApi/modelsCompt/model_compitition.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/model/modeApi/balance/commissionBalance.dart';
import 'package:rayan/model/modeApi/modelsCompt/common_questions.dart';
import 'package:rayan/model/modeApi/modelsCompt/getWinner.dart';
import 'package:rayan/model/modeApi/balance/userBalancLog.dart';
import 'package:rayan/model/modeApi/balance/userBalance.dart';
import 'package:rayan/model/modelJson/model_all_notifications.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modelJson/resul_login_model.dart';
import 'package:rayan/utils/constant/url.dart';
import 'package:rayan/view/other/home_page.dart';

var successloginresult;
var tokenloginresult;
var dataloginresult;
var countryIdSaveprf;
var cityIdSavepref;
var idSaveprefpref;
var usernamepref;
var firstNamepref;
var midNamepref;
var lastNamepref;
var phonepref;
var passPref;
var imageProfileSavepref;
var marketingCodeeSavepref;
var preuniqueCodepref;
var token;
var fullName;
getpreflog() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  idSaveprefpref = pres.getInt('id');
  print(idSaveprefpref);
  controller.SaveUserId(idSaveprefpref);
  usernamepref = pres.getString('userName');
  controller.SaveUserName(usernamepref);
  passPref = pres.getString('password');
  controller.SaveNewPassword(passPref);
  firstNamepref = pres.getString('firstName');
  controller.SaveFirstName(firstNamepref);
  midNamepref = pres.getString('midName');
  controller.SaveMidName(midNamepref);
  lastNamepref = pres.getString('lastName');
  controller.SaveLastName(lastNamepref);
  countryIdSaveprf = pres.getInt('countryId');
  controller.SaveCountryid(countryIdSaveprf);
  cityIdSavepref = pres.getInt('cityId');
  controller.SavecityId(cityIdSavepref);
  imageProfileSavepref = pres.getString('imageProfile');
  if (imageProfileSavepref == null ||
      imageProfileSavepref == "null" ||
      imageProfileSavepref == "") {
    print("imageProfileSavepref");
    print("1");
    print(imageProfileSavepref);
    controller.SavePathImage(
        "https://media.istockphoto.com/vectors/avatar-person-user-icon-blue-color-vector-id1216255389?k=20&m=1216255389&s=170667a&w=0&h=uklU-WnkSAvUCtqrB4vxbga1hfYfBWRcQQlEYKhhrdQ=");
  } else {
    print("imageProfileSavepref");
    print("2");
    print(imageProfileSavepref);
    controller.SavePathImage(
        "http://212.24.108.54/wsaAdmin/images/" + imageProfileSavepref);
  }

  marketingCodeeSavepref = pres.getString('marketingCode');
  controller.SavemarketingCodeeSavepref(marketingCodeeSavepref);
  phonepref = pres.getString('telephoneNumber');
  controller.SaveNumberPhone(phonepref);
  preuniqueCodepref = pres.getString('uniqueCode');
  controller.SavepreuniqueCodepref(preuniqueCodepref);
  tokenloginresult = pres.getString('token');
  print(tokenloginresult);
  controller.SaveUserToken(idSaveprefpref);
  fullName = firstNamepref + " " + midNamepref + " " + lastNamepref;
  //fullName = "gad man hadi";
  print(fullName);
  getAllAgents(tokenloginresult, countryIdSaveprf, cityIdSavepref);
  getWinner(tokenloginresult);
  userBalanc();
  userBalancLog();
  comissionBalanc();
  getSettingAbout();
  getSettingTerms();
  getSettingSpicSocialMediaFacebook();
  getSettingSpicSocialMediaYouTube();
  getSettingSpicSocialMediaWhatapp();

  getSettingSpicSocialMediaTelgram();
  getSettingPrivasyPolicy();
  infoNotification();
  GetNotification();
  commonQuestionsapi();
  MyCompitition = [];
  allCompititionapi();
  getSettingAmount();
  allAgent = [];
  winner = [];
  winnerQustion = [];
  getWinnerQustion();
  // getAllAgents(tokenloginresult, countryIdSaveprf, cityIdSavepref);
  // getWinner(tokenloginresult);
  // userBalanc();
  // userBalancLog();
  // comissionBalanc();
}

FocusNode myFocusNode = new FocusNode();
sendIpToken(tokenloginresult) async {
  var identifier;
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId!; //UUID for Android
      controller.SaveDeviceId(identifier);
      print("*********androidId********");
      print(identifier);
      print("*********identifier********");
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      identifier = data.identifierForVendor!; //UUID for iOS
      controller.SaveDeviceId(identifier);
      print("*********isIOS********");
      print(identifier);
      print("*********identifier********");
    }
  } on PlatformException {
    print('Failed to get platform version');
  }
  String? token = await FirebaseMessaging.instance.getToken();
  var headers = {
    'Authorization': 'Bearer $tokenloginresult',
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse('http://212.24.108.54/wsa/api/user/addDeviceToken'));
  request.body = json.encode({"DeciveId": identifier, "Token": token});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future send_inf_login(email, password, context) async {
  homecontroller controller = Get.put(homecontroller());
  print("========information in function==========");
  print(email);
  print(password);
  print("========================");
  var headers = {
    'Authorization': 'Bearer ',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(url_login));
  request.body =
      json.encode({"UserName": email, "Password": password, "Token": ""});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  resultLoginModel c = resultLoginModel.fromJson(jsonDecode(res.body));
  successloginresult = c.toJson()["isSuccess"];
  print("5555555555555555555555555555555");
  print(successloginresult);
  /************************************** */
  if (response.statusCode == 200) {
    if (successloginresult == true) {
      resultLoginModelData d =
          resultLoginModelData.fromJson(jsonDecode(res.body));
      tokenloginresult = d.toJson()["token"];
      dataloginresult = d.toJson()["data"];
      print(successloginresult);
      print(tokenloginresult);
      print(dataloginresult);
      /************************************** */
      print(dataloginresult["token"]);
      SharedPreferences prestoken = await SharedPreferences.getInstance();
      prestoken.setString("token", tokenloginresult);
      tokenloginresult = prestoken.getString('token');
      controller.SaveUserToken(idSaveprefpref);
      /************************************** */

      print(dataloginresult["id"]);
      SharedPreferences presid = await SharedPreferences.getInstance();
      presid.setInt("id", dataloginresult["id"]);
      idSaveprefpref = presid.getInt('id');
      controller.SaveUserId(idSaveprefpref);
      /////////////////////////////////
      print(dataloginresult["userName"]);
      SharedPreferences presuser = await SharedPreferences.getInstance();
      presuser.setString('userName', dataloginresult["userName"]);
      usernamepref = presuser.getString('userName');
      controller.SaveUserName(usernamepref);
/////////////////////////////////
      print(dataloginresult["password"]);
      SharedPreferences prespass = await SharedPreferences.getInstance();
      prespass.setString('password', dataloginresult["password"]);
      passPref = prespass.getString('password');
      controller.SaveNewPassword(passPref);
      /////////////////////////////////
      print(dataloginresult["userType"]);
      SharedPreferences prestype = await SharedPreferences.getInstance();
      prestype.setInt('userType', dataloginresult["userType"]);

/////////////////////////////////
      print(dataloginresult["firstName"]);
      SharedPreferences presfirst = await SharedPreferences.getInstance();
      presfirst.setString('firstName', dataloginresult["firstName"]);
      firstNamepref = presfirst.getString('firstName');
      controller.SaveFirstName(firstNamepref);
/////////////////////////////////
      print(dataloginresult["midName"]);
      SharedPreferences presmid = await SharedPreferences.getInstance();
      presmid.setString('midName', dataloginresult["midName"]);
      midNamepref = presmid.getString('midName');
      controller.SaveMidName(midNamepref);
/////////////////////////////////
      print(dataloginresult["lastName"]);
      SharedPreferences preslast = await SharedPreferences.getInstance();
      preslast.setString('lastName', dataloginresult["lastName"]);
      lastNamepref = preslast.getString('lastName');
      controller.SaveLastName(lastNamepref);
/////////////////////////////////
      print(dataloginresult["countryId"]);
      SharedPreferences prescountry = await SharedPreferences.getInstance();
      prescountry.setInt('countryId', dataloginresult["countryId"]);
      countryIdSaveprf = prescountry.getInt('countryId');
      controller.SaveCountryid(countryIdSaveprf);
/////////////////////////////////
      print(dataloginresult["cityId"]);
      SharedPreferences prescity = await SharedPreferences.getInstance();
      prescity.setInt('cityId', dataloginresult["cityId"]);
      cityIdSavepref = prescity.getInt('cityId');
      controller.SavecityId(cityIdSavepref);
      /////////////////////////////////
      print(dataloginresult["imageProfile"]);
      SharedPreferences presimageProfile =
          await SharedPreferences.getInstance();
      presimageProfile.setString(
          'imageProfile', dataloginresult["imageProfile"]);
      imageProfileSavepref = presimageProfile.getString('imageProfile');
      controller.SavePathImage(
          "http://212.24.108.54/wsaAdmin/images/" + imageProfileSavepref);
      /////////////////////////////////
      SharedPreferences presMarket = await SharedPreferences.getInstance();
      presMarket.setString('marketingCode', dataloginresult["marketingCode"]);
      marketingCodeeSavepref = presMarket.getString('marketingCode');
      controller.SavemarketingCodeeSavepref(marketingCodeeSavepref);
/////////////////////////////////
      ///
      print(dataloginresult["telephoneNumber"]);
      SharedPreferences presphone = await SharedPreferences.getInstance();
      presphone.setString(
          'telephoneNumber', dataloginresult["telephoneNumber"]);
      phonepref = presphone.getString('telephoneNumber');
      controller.SaveNumberPhone(phonepref);
      /////////////////////////////////

      print(dataloginresult["uniqueCode"]);
      SharedPreferences preuniqueCode = await SharedPreferences.getInstance();
      preuniqueCode.setString('uniqueCode', dataloginresult["uniqueCode"]);
      preuniqueCodepref = preuniqueCode.getString('uniqueCode');
      controller.SavepreuniqueCodepref(preuniqueCodepref);

      print("IsLogin: ****");
      SharedPreferences presIsLogin = await SharedPreferences.getInstance();
      presIsLogin.setBool("isLogin", true);
      print("******************************");
      sendIpToken(tokenloginresult);
      print("******************************");
      // controller.SaveUsersIsLogin(isLogin);
      // Navigator.of(context).pushReplacementNamed("homePage");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => new homePage()),
          (Route<dynamic> route) => false);
    } else {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'خطأ',
              btnOkOnPress: () {},
              body: Text("اسم المستخدم أو كلمة المرور خطأ",
                  style: TextStyle(
                      color: MyColors.color3,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color2,
              btnOkColor: MyColors.color1)
          .show();
    }
  } else {
    print(response.reasonPhrase);
    AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'خطأ',
            btnOkOnPress: () {},
            body: Text("خطأ بالاتصال",
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 14,
                    fontFamily: 'Almarai')),
            dialogBackgroundColor: MyColors.color2,
            btnOkColor: MyColors.color1)
        .show();
  }
}

Future send_inf_loginupdate(usernamepref, passPref) async {
  homecontroller controller = Get.put(homecontroller());
  print("========information in function==========");
  print(usernamepref);
  print(passPref);
  print("========================");
  var headers = {
    'Authorization': 'Bearer ',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(url_login));
  request.body = json
      .encode({"UserName": usernamepref, "Password": passPref, "Token": ""});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  resultLoginModel c = resultLoginModel.fromJson(jsonDecode(res.body));
  successloginresult = c.toJson()["isSuccess"];
  print("5555555555555555555555555555555");
  print(successloginresult);
  /************************************** */
  if (response.statusCode == 200) {
    if (successloginresult == true) {
      resultLoginModelData d =
          resultLoginModelData.fromJson(jsonDecode(res.body));
      tokenloginresult = d.toJson()["token"];
      dataloginresult = d.toJson()["data"];
      print(successloginresult);
      print(tokenloginresult);
      print(dataloginresult);
      /************************************** */
      print(dataloginresult["token"]);
      SharedPreferences prestoken = await SharedPreferences.getInstance();
      prestoken.setString("token", tokenloginresult);
      tokenloginresult = prestoken.getString('token');
      controller.SaveUserToken(idSaveprefpref);
      /************************************** */

      print(dataloginresult["id"]);
      SharedPreferences presid = await SharedPreferences.getInstance();
      presid.setInt("id", dataloginresult["id"]);
      idSaveprefpref = presid.getInt('id');
      controller.SaveUserId(idSaveprefpref);
      /////////////////////////////////
      print(dataloginresult["userName"]);
      SharedPreferences presuser = await SharedPreferences.getInstance();
      presuser.setString('userName', dataloginresult["userName"]);
      usernamepref = presuser.getString('userName');
      controller.SaveUserName(usernamepref);
/////////////////////////////////
      print(dataloginresult["password"]);
      SharedPreferences prespass = await SharedPreferences.getInstance();
      prespass.setString('password', dataloginresult["password"]);
      passPref = prespass.getString('password');
      controller.SaveNewPassword(passPref);
      /////////////////////////////////
      print(dataloginresult["userType"]);
      SharedPreferences prestype = await SharedPreferences.getInstance();
      prestype.setInt('userType', dataloginresult["userType"]);

/////////////////////////////////
      print(dataloginresult["firstName"]);
      SharedPreferences presfirst = await SharedPreferences.getInstance();
      presfirst.setString('firstName', dataloginresult["firstName"]);
      firstNamepref = presfirst.getString('firstName');
      controller.SaveFirstName(firstNamepref);
/////////////////////////////////
      print(dataloginresult["midName"]);
      SharedPreferences presmid = await SharedPreferences.getInstance();
      presmid.setString('midName', dataloginresult["midName"]);
      midNamepref = presmid.getString('midName');
      controller.SaveMidName(midNamepref);
/////////////////////////////////
      print(dataloginresult["lastName"]);
      SharedPreferences preslast = await SharedPreferences.getInstance();
      preslast.setString('lastName', dataloginresult["lastName"]);
      lastNamepref = preslast.getString('lastName');
      controller.SaveLastName(lastNamepref);
/////////////////////////////////
      print(dataloginresult["countryId"]);
      SharedPreferences prescountry = await SharedPreferences.getInstance();
      prescountry.setInt('countryId', dataloginresult["countryId"]);
      countryIdSaveprf = prescountry.getInt('countryId');
      controller.SaveCountryid(countryIdSaveprf);
/////////////////////////////////
      print(dataloginresult["cityId"]);
      SharedPreferences prescity = await SharedPreferences.getInstance();
      prescity.setInt('cityId', dataloginresult["cityId"]);
      cityIdSavepref = prescity.getInt('cityId');
      controller.SavecityId(cityIdSavepref);
      /////////////////////////////////
      print(dataloginresult["imageProfile"]);
      SharedPreferences presimageProfile =
          await SharedPreferences.getInstance();
      presimageProfile.setString(
          'imageProfile', dataloginresult["imageProfile"]);
      imageProfileSavepref = presimageProfile.getString('imageProfile');
      controller.SavePathImage(
          "http://212.24.108.54/wsaAdmin/images/" + imageProfileSavepref);
      /////////////////////////////////
      SharedPreferences presMarket = await SharedPreferences.getInstance();
      presMarket.setString('marketingCode', dataloginresult["marketingCode"]);
      marketingCodeeSavepref = presMarket.getString('marketingCode');
      controller.SavemarketingCodeeSavepref(marketingCodeeSavepref);
/////////////////////////////////
      ///
      print(dataloginresult["telephoneNumber"]);
      SharedPreferences presphone = await SharedPreferences.getInstance();
      presphone.setString(
          'telephoneNumber', dataloginresult["telephoneNumber"]);
      phonepref = presphone.getString('telephoneNumber');
      controller.SaveNumberPhone(phonepref);
      /////////////////////////////////

      print(dataloginresult["uniqueCode"]);
      SharedPreferences preuniqueCode = await SharedPreferences.getInstance();
      preuniqueCode.setString('uniqueCode', dataloginresult["uniqueCode"]);
      preuniqueCodepref = preuniqueCode.getString('uniqueCode');
      controller.SavepreuniqueCodepref(preuniqueCodepref);

      print("IsLogin: ****");
      SharedPreferences presIsLogin = await SharedPreferences.getInstance();
      presIsLogin.setBool("isLogin", true);
      print("******************************");
    }
  }
}
