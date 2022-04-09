// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class userBalanceLogModel {
  userBalanceLogModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory userBalanceLogModel.fromJson(Map<String, dynamic> json) =>
      userBalanceLogModel(
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
    required this.userId,
    required this.code,
    required this.message,
    required this.balance,
    required this.createDate,
    required this.id,
  });

  int userId;
  String code;
  String message;
  double balance;
  DateTime createDate;
  int id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["userId"],
        code: json["code"],
        message: json["message"],
        balance: json["balance"],
        createDate: DateTime.parse(json["createDate"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "code": code,
        "message": message,
        "balance": balance,
        "createDate": createDate.toIso8601String(),
        "id": id,
      };
}
