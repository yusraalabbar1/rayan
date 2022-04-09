// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class modelQuestionWinner {
  modelQuestionWinner({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory modelQuestionWinner.fromJson(Map<String, dynamic> json) =>
      modelQuestionWinner(
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
    required this.question,
    required this.active,
  });

  int id;
  String question;
  bool active;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "active": active,
      };
}
