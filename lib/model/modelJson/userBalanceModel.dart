// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class userBalanceModel {
  userBalanceModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool? isSuccess;
  String? message;
  Data? data;

  factory userBalanceModel.fromJson(Map<String, dynamic> json) =>
      userBalanceModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data != null ? data!.toJson() : null,
      };
}

class Data {
  Data({
    required this.userId,
    required this.balances,
    required this.id,
  });

  int? userId;
  double? balances;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        balances: json["balances"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "balances": balances,
        "id": id,
      };
}
