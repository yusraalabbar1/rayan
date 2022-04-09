// class NumberOfNotification {
//   int status;
//   String msg;
//   int data;

//   NumberOfNotification({required this.status, required this.msg, required this.data});

//   NumberOfNotification.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     data = json['data'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['msg'] = this.msg;
//     data['data'] = this.data;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class NumberOfNotification {
  NumberOfNotification({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  Data data;

  factory NumberOfNotification.fromJson(Map<String, dynamic> json) =>
      NumberOfNotification(
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
    required this.notificationCount,
  });

  int notificationCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notificationCount: json["notificationCount"],
      );

  Map<String, dynamic> toJson() => {
        "notificationCount": notificationCount,
      };
}
