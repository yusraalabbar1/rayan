// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// commonQuestions welcomeFromJson(String str) => commonQuestions.fromJson(json.decode(str));

// String welcomeToJson(commonQuestions data) => json.encode(data.toJson());

class commonQuestions {
  commonQuestions({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory commonQuestions.fromJson(Map<String, dynamic> json) =>
      commonQuestions(
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
    required this.answer,
    required this.active,
  });

  int id;
  String question;
  String answer;
  bool active;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "active": active,
      };
}
