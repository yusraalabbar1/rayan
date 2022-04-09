import 'dart:convert';

class addCompitationVoteModel {
  addCompitationVoteModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory addCompitationVoteModel.fromJson(Map<String, dynamic> json) =>
      addCompitationVoteModel(
        isSuccess: json["isSuccess"] ?? false,
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data,
      };
}
