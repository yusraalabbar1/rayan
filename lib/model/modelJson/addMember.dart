import 'dart:convert';

class AddMember {
  AddMember({
    required this.isSuccess,
    required this.message,
    // required this.data,
  });

  bool isSuccess;
  String message;
  //String data;

  factory AddMember.fromJson(Map<String, dynamic> json) => AddMember(
        isSuccess: json["isSuccess"] == null ? false : json["isSuccess"],
        message: json["message"],
        // data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        // "data": data,
      };
}

class AddMemberData {
  AddMemberData({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  Data data;

  factory AddMemberData.fromJson(Map<String, dynamic> json) => AddMemberData(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.memberNo,
  });

  int memberNo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        memberNo: json["memberNo"],
      );

  Map<String, dynamic> toJson() => {
        "memberNo": memberNo,
      };
}
