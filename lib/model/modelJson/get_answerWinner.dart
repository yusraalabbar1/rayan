// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class getAnswerWinner {
  getAnswerWinner({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory getAnswerWinner.fromJson(Map<String, dynamic> json) =>
      getAnswerWinner(
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
    required this.competitionMemberId,
    required this.competitionMemberNickName,
    required this.winnerQuestionId,
    required this.winnerQuestionName,
    required this.answer,
  });

  int id;
  int competitionMemberId;
  String competitionMemberNickName;
  int winnerQuestionId;
  String winnerQuestionName;
  String answer;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        competitionMemberId: json["competitionMemberId"],
        competitionMemberNickName: json["competitionMemberNickName"],
        winnerQuestionId: json["winnerQuestionId"],
        winnerQuestionName: json["winnerQuestionName"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "competitionMemberId": competitionMemberId,
        "competitionMemberNickName": competitionMemberNickName,
        "winnerQuestionId": winnerQuestionId,
        "winnerQuestionName": winnerQuestionName,
        "answer": answer,
      };
}
