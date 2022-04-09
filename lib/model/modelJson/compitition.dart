// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class comititionModel {
  comititionModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory comititionModel.fromJson(Map<String, dynamic> json) =>
      comititionModel(
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
    required this.competitionsId,
    required this.name,
    required this.description,
    required this.awardAmount,
    required this.amount,
    required this.imageUrl,
    required this.tourOneDate,
    required this.currentTourId,
    required this.currentTourName,
    required this.currentTourTimeLimit,
    required this.memberCount,
    required this.maxMember,
    required this.remanningMember,
    required this.balance,
    required this.active,
    required this.isFinish,
    required this.competitionTours,
  });

  int competitionsId;
  String name;
  String description;
  double awardAmount;
  double amount;
  String imageUrl;
  DateTime tourOneDate;
  var currentTourId;
  var currentTourName;
  var currentTourTimeLimit;
  int memberCount;
  int maxMember;
  int remanningMember;
  double balance;
  bool active;
  bool isFinish;
  List<dynamic> competitionTours;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionsId: json["competitionsId"],
        name: json["name"],
        description: json["description"],
        awardAmount: json["awardAmount"],
        amount: json["amount"],
        imageUrl: json["imageUrl"],
        tourOneDate: DateTime.parse(json["tourOneDate"]),
        currentTourId:
            json["currentTourId"] == null ? null : json["currentTourId"],
        currentTourName:
            json["currentTourName"] == null ? null : json["currentTourName"],
        currentTourTimeLimit: json["currentTourTimeLimit"] == null
            ? null
            : json["currentTourTimeLimit"],
        memberCount: json["memberCount"],
        maxMember: json["maxMember"],
        remanningMember: json["remanningMember"],
        balance: json["balance"],
        active: json["active"],
        isFinish: json["isFinish"],
        competitionTours:
            List<dynamic>.from(json["competitionTours"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "competitionsId": competitionsId,
        "name": name,
        "description": description,
        "awardAmount": awardAmount,
        "amount": amount,
        "imageUrl": imageUrl,
        "tourOneDate": tourOneDate.toIso8601String(),
        "currentTourId": currentTourId == null ? null : currentTourId,
        "currentTourName": currentTourName == null ? null : currentTourName,
        "currentTourTimeLimit":
            currentTourTimeLimit == null ? null : currentTourTimeLimit,
        "memberCount": memberCount,
        "maxMember": maxMember,
        "remanningMember": remanningMember,
        "balance": balance,
        "active": active,
        "isFinish": isFinish,
        "competitionTours": List<dynamic>.from(competitionTours.map((x) => x)),
      };
}
