import 'dart:convert';

class modelVerifyOtp {
  modelVerifyOtp({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  String data;

  factory modelVerifyOtp.fromJson(Map<String, dynamic> json) => modelVerifyOtp(
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
