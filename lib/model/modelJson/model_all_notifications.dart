// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

allNotificaion welcomeFromJson(String str) =>
    allNotificaion.fromJson(json.decode(str));

String welcomeToJson(allNotificaion data) => json.encode(data.toJson());

class allNotificaion {
  allNotificaion({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<infoNotification>? data;

  factory allNotificaion.fromJson(Map<String, dynamic> json) => allNotificaion(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<infoNotification>.from(
            json["data"].map((x) => infoNotification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class infoNotification {
  infoNotification({
    this.title,
    this.body,
    this.date,
    this.archived,
    this.notificationImage,
    this.id,
  });

  String? title;
  String? body;
  DateTime? date;
  int? archived;
  String? notificationImage;
  int? id;

  factory infoNotification.fromJson(Map<String, dynamic> json) =>
      infoNotification(
        title: json["title"],
        body: json["body"],
        date: DateTime.parse(json["date"]),
        archived: json["archived"],
        notificationImage: json["notificationImage"] == null
            ? null
            : json["notificationImage"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "date": date!.toIso8601String(),
        "archived": archived,
        "notificationImage":
            notificationImage == null ? null : notificationImage,
        "id": id,
      };
}
