// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class ModeGetUserProfileWithMedia {
  ModeGetUserProfileWithMedia({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  Data data;

  factory ModeGetUserProfileWithMedia.fromJson(Map<String, dynamic> json) =>
      ModeGetUserProfileWithMedia(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
    required this.userMedia,
  });

  User user;
  List<UserMedia> userMedia;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        userMedia: List<UserMedia>.from(
            json["userMedia"].map((x) => UserMedia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "userMedia": List<dynamic>.from(userMedia.map((x) => x.toJson())),
      };
}

class User {
  User({
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
    this.userMarketingCode,
    required this.deciveId,
    required this.createdDate,
    required this.otpCode,
    required this.active,
  });

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
  String deciveId;
  DateTime createdDate;
  dynamic otpCode;
  bool active;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        imageProfile: json["imageProfile"],
        uniqueCode: json["uniqueCode"],
        marketingCode: json["marketingCode"],
        userMarketingCode: json["userMarketingCode"],
        deciveId: json["deciveId"],
        createdDate: DateTime.parse(json["createdDate"]),
        otpCode: json["otpCode"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
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

class UserMedia {
  UserMedia({
    required this.userId,
    required this.mediaType,
    required this.code,
    required this.mediaTypeArDesc,
    required this.mediaTypeEnDesc,
    required this.value,
    required this.active,
    required this.id,
  });

  int userId;
  int mediaType;
  String code;
  String mediaTypeArDesc;
  String mediaTypeEnDesc;
  String value;
  bool active;
  int id;

  factory UserMedia.fromJson(Map<String, dynamic> json) => UserMedia(
        userId: json["userId"],
        mediaType: json["mediaType"],
        code: json["code"],
        mediaTypeArDesc: json["mediaTypeArDesc"],
        mediaTypeEnDesc: json["mediaTypeEnDesc"],
        value: json["value"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "mediaType": mediaType,
        "code": code,
        "mediaTypeArDesc": mediaTypeArDesc,
        "mediaTypeEnDesc": mediaTypeEnDesc,
        "value": value,
        "active": active,
        "id": id,
      };
}
