import 'dart:convert';

class updateMarketCode {
  updateMarketCode({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  String data;

  factory updateMarketCode.fromJson(Map<String, dynamic> json) =>
      updateMarketCode(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data,
      };
}
