import 'dart:convert';

class modelQuistionAnswer {
  modelQuistionAnswer({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  String data;

  factory modelQuistionAnswer.fromJson(Map<String, dynamic> json) =>
      modelQuistionAnswer(
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
