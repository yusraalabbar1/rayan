// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

resultSignUp welcomeFromJson(String str) =>
    resultSignUp.fromJson(json.decode(str));

String welcomeToJson(resultSignUp data) => json.encode(data.toJson());

class resultSignUp {
  resultSignUp({
    required this.isSuccess,
    required this.message,
  });

  bool isSuccess;
  String message;

  factory resultSignUp.fromJson(Map<String, dynamic> json) => resultSignUp(
        isSuccess: json["isSuccess"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
      };
}
