// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class genrOtp {
  genrOtp({
    required this.isSuccess,
    required this.message,
    // required this.data,
  });

  bool isSuccess;
  String message;
  // Data data;

  factory genrOtp.fromJson(Map<String, dynamic> json) => genrOtp(
        isSuccess: json["isSuccess"],
        message: json["message"],
        // data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        // "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.userId,
  });

  int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
