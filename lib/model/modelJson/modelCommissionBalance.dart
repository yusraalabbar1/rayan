// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class modellComissionBalance {
  modellComissionBalance({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  Data data;

  factory modellComissionBalance.fromJson(Map<String, dynamic> json) =>
      modellComissionBalance(
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
    required this.commissionBalance,
  });

  double commissionBalance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        commissionBalance: json["commissionBalance"],
      );

  Map<String, dynamic> toJson() => {
        "commissionBalance": commissionBalance,
      };
}
