// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

getLookUpValue welcomeFromJson(String str) =>
    getLookUpValue.fromJson(json.decode(str));

String welcomeToJson(getLookUpValue data) => json.encode(data.toJson());

class getLookUpValue {
  getLookUpValue({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<AllSocialMedia>? data;

  factory getLookUpValue.fromJson(Map<String, dynamic> json) => getLookUpValue(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<AllSocialMedia>.from(
            json["data"].map((x) => AllSocialMedia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AllSocialMedia {
  AllSocialMedia({
    this.lookupCode,
    this.values,
    this.id,
  });

  String? lookupCode;
  List<Value>? values;
  int? id;

  factory AllSocialMedia.fromJson(Map<String, dynamic> json) => AllSocialMedia(
        lookupCode: json["lookupCode"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "lookupCode": lookupCode,
        "values": List<dynamic>.from(values!.map((x) => x.toJson())),
        "id": id,
      };
}

class Value {
  Value({
    this.lookupValueId,
    this.lookupId,
    this.code,
    this.valueEn,
    this.valueAr,
    this.id,
  });

  int? lookupValueId;
  int? lookupId;
  String? code;
  String? valueEn;
  String? valueAr;
  int? id;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        lookupValueId: json["lookupValueId"],
        lookupId: json["lookupId"],
        code: json["code"],
        valueEn: json["valueEn"],
        valueAr: json["valueAr"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "lookupValueId": lookupValueId,
        "lookupId": lookupId,
        "code": code,
        "valueEn": valueEn,
        "valueAr": valueAr,
        "id": id,
      };
}
