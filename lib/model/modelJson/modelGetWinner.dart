// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class modelGetWin {
  modelGetWin({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory modelGetWin.fromJson(Map<String, dynamic> json) => modelGetWin(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
        // data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null
        // "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.fullName,
    required this.imageProfile,
    required this.countryDescAr,
    required this.countryDescEn,
    required this.countryFlag,
    required this.awardAmount,
  });

  String? fullName;
  dynamic? imageProfile;
  String? countryDescAr;
  String? countryDescEn;
  String? countryFlag;
  double? awardAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fullName: json["fullName"],
        imageProfile: json["imageProfile"],
        countryDescAr: json["countryDescAr"],
        countryDescEn: json["countryDescEn"],
        countryFlag: json["countryFlag"],
        awardAmount: json["awardAmount"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "imageProfile": imageProfile,
        "countryDescAr": countryDescAr,
        "countryDescEn": countryDescEn,
        "countryFlag": countryFlag,
        "awardAmount": awardAmount,
      };
}
