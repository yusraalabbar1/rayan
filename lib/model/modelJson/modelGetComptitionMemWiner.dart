// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class modelComWinner1 {
  modelComWinner1({required this.isSuccess, required this.message});

  bool isSuccess;
  String message;
  factory modelComWinner1.fromJson(Map<String, dynamic> json) =>
      modelComWinner1(
        isSuccess: json["isSuccess"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
      };
}

class modelComWinner {
  modelComWinner({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  Data? data;

  factory modelComWinner.fromJson(Map<String, dynamic> json) => modelComWinner(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data!.toJson() != null ? data!.toJson() : null,
      };
}

class Data {
  Data({
    required this.id,
    required this.competitionId,
    required this.memberId,
    required this.nickName,
    required this.memberNo,
    this.memberLink,
    required this.voteNumber,
  });

  int? id;
  int? competitionId;
  int? memberId;
  String? nickName;
  int? memberNo;
  dynamic memberLink;
  int? voteNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] != null ? json["id"] : null,
        competitionId:
            json["competitionId"] != null ? json["competitionId"] : null,
        memberId: json["memberId"] != null ? json["memberId"] : null,
        nickName: json["nickName"] != null ? json["nickName"] : null,
        memberNo: json["memberNo"] != null ? json["memberNo"] : null,
        memberLink: json["memberLink"] != null ? json["memberLink"] : null,
        voteNumber: json["voteNumber"] != null ? json["voteNumber"] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id != null ? id : null,
        "competitionId": competitionId != null ? competitionId : null,
        "memberId": memberId != null ? memberId : null,
        "nickName": nickName != null ? nickName : null,
        "memberNo": memberNo != null ? memberNo : null,
        "memberLink": memberLink != null ? memberLink : null,
        "voteNumber": voteNumber != null ? voteNumber : null,
      };
}
