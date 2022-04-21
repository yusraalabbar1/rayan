// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class getAllCompitionMember {
  getAllCompitionMember({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory getAllCompitionMember.fromJson(Map<String, dynamic> json) =>
      getAllCompitionMember(
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
    required this.competitionId,
    required this.memberId,
    required this.nickName,
    required this.memberNo,
    required this.memberLink,
    required this.voteNumber,
    required this.memberImageUrl,
  });

  int id;
  int competitionId;
  int memberId;
  String nickName;
  int memberNo;
  dynamic memberLink;
  int voteNumber;
  String? memberImageUrl;
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        competitionId: json["competitionId"],
        memberId: json["memberId"],
        nickName: json["nickName"],
        memberNo: json["memberNo"],
        memberLink: json["memberLink"],
        voteNumber: json["voteNumber"],
        memberImageUrl: json["memberImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "competitionId": competitionId,
        "memberId": memberId,
        "nickName": nickName,
        "memberNo": memberNo,
        "memberLink": memberLink,
        "voteNumber": voteNumber,
        "memberImageUrl": memberImageUrl
      };
}
