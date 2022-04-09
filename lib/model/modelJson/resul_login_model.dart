// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

resultLoginModel welcomeFromJson(String str) =>
    resultLoginModel.fromJson(json.decode(str));

String welcomeToJson(resultLoginModel data) => json.encode(data.toJson());

class resultLoginModel {
  resultLoginModel({
    this.isSuccess,
    this.message,
  });

  bool? isSuccess;
  String? message;

  factory resultLoginModel.fromJson(Map<String, dynamic> json) =>
      resultLoginModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
      };
}

class resultLoginModelData {
  resultLoginModelData({
    this.isSuccess,
    this.message,
    this.token,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? token;
  Data? data;

  factory resultLoginModelData.fromJson(Map<String, dynamic> json) =>
      resultLoginModelData(
        isSuccess: json["isSuccess"],
        message: json["message"],
        token: json["token"] == null ? "" : json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "token": token,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.balances,
    required this.id,
    required this.userName,
    required this.password,
    required this.userType,
    required this.firstName,
    required this.midName,
    required this.lastName,
    required this.countryId,
    required this.cityId,
    required this.telephoneNumber,
    required this.imageProfile,
    required this.uniqueCode,
    required this.marketingCode,
    required this.userMarketingCode,
    required this.deciveId,
    required this.createdDate,
    required this.otpCode,
    required this.active,
  });

  double balances;
  int id;
  String userName;
  String password;
  int userType;
  String firstName;
  String midName;
  String lastName;
  int countryId;
  int cityId;
  String telephoneNumber;
  dynamic imageProfile;
  String uniqueCode;
  String marketingCode;
  dynamic userMarketingCode;
  dynamic deciveId;
  DateTime createdDate;
  dynamic otpCode;
  bool active;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balances: json["balances"].toDouble(),
        id: json["id"],
        userName: json["userName"],
        password: json["password"],
        userType: json["userType"],
        firstName: json["firstName"],
        midName: json["midName"],
        lastName: json["lastName"],
        countryId: json["countryId"],
        cityId: json["cityId"],
        telephoneNumber: json["telephoneNumber"],
        imageProfile: json["imageProfile"] ?? "",
        uniqueCode: json["uniqueCode"],
        marketingCode: json["marketingCode"],
        userMarketingCode: json["userMarketingCode"],
        deciveId: json["deciveId"],
        createdDate: DateTime.parse(json["createdDate"]),
        otpCode: json["otpCode"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "balances": balances,
        "id": id,
        "userName": userName,
        "password": password,
        "userType": userType,
        "firstName": firstName,
        "midName": midName,
        "lastName": lastName,
        "countryId": countryId,
        "cityId": cityId,
        "telephoneNumber": telephoneNumber,
        "imageProfile": imageProfile,
        "uniqueCode": uniqueCode,
        "marketingCode": marketingCode,
        "userMarketingCode": userMarketingCode,
        "deciveId": deciveId,
        "createdDate": createdDate.toIso8601String(),
        "otpCode": otpCode,
        "active": active,
      };
}
