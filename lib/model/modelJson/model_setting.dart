// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

setting welcomeFromJson(String str) => setting.fromJson(json.decode(str));

String welcomeToJson(setting data) => json.encode(data.toJson());

class setting {
  setting({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory setting.fromJson(Map<String, dynamic> json) => setting(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.value,
    required this.isEditior,
    required this.isMedia,
    required this.displayName,
  });

  int id;
  String name;
  String value;
  bool isEditior;
  bool isMedia;
  String displayName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        isEditior: json["isEditior"],
        isMedia: json["isMedia"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "isEditior": isEditior,
        "isMedia": isMedia,
        "displayName": displayName,
      };
}
