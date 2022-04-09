import 'dart:convert';

class rechargeBalanceFromUserToUserModel {
  rechargeBalanceFromUserToUserModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  String data;

  factory rechargeBalanceFromUserToUserModel.fromJson(
          Map<String, dynamic> json) =>
      rechargeBalanceFromUserToUserModel(
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
