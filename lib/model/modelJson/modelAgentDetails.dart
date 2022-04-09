// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class modelAgentsDetails {
  modelAgentsDetails({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  Data data;

  factory modelAgentsDetails.fromJson(Map<String, dynamic> json) =>
      modelAgentsDetails(
        isSuccess: json["isSuccess"] ?? false,
        message: json["message"] ?? "",
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
    required this.countryId,
    required this.cityId,
    required this.name,
    required this.description,
    required this.locationDesc,
    required this.imageUrl,
    required this.active,
    required this.agentImages,
    required this.agentMedia,
    required this.id,
  });

  String countryId;
  String cityId;
  String name;
  String description;
  String locationDesc;
  String imageUrl;
  bool active;
  List<AgentImage> agentImages;
  List<AgentMedia> agentMedia;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countryId: json["countryId"],
        cityId: json["cityId"],
        name: json["name"],
        description: json["description"],
        locationDesc: json["locationDesc"],
        imageUrl: json["imageUrl"],
        active: json["active"],
        agentImages: List<AgentImage>.from(
            json["agentImages"].map((x) => AgentImage.fromJson(x))),
        agentMedia: List<AgentMedia>.from(
            json["agentMedia"].map((x) => AgentMedia.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "cityId": cityId,
        "name": name,
        "description": description,
        "locationDesc": locationDesc,
        "imageUrl": imageUrl,
        "active": active,
        "agentImages": List<dynamic>.from(agentImages.map((x) => x.toJson())),
        "agentMedia": List<dynamic>.from(agentMedia.map((x) => x.toJson())),
        "id": id,
      };
}

class AgentImage {
  AgentImage({
    required this.agentId,
    required this.imageUrl,
    required this.active,
    required this.id,
  });

  int agentId;
  String imageUrl;
  bool active;
  int id;

  factory AgentImage.fromJson(Map<String, dynamic> json) => AgentImage(
        agentId: json["agentId"],
        imageUrl: json["imageUrl"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "agentId": agentId,
        "imageUrl": imageUrl,
        "active": active,
        "id": id,
      };
}

class AgentMedia {
  AgentMedia({
    required this.agentId,
    required this.mediaType,
    required this.code,
    required this.mediaTypeArDesc,
    required this.mediaTypeEnDesc,
    required this.value,
    required this.active,
    required this.id,
  });

  int agentId;
  int mediaType;
  String code;
  String mediaTypeArDesc;
  String mediaTypeEnDesc;
  String value;
  bool active;
  int id;

  factory AgentMedia.fromJson(Map<String, dynamic> json) => AgentMedia(
        agentId: json["agentId"],
        mediaType: json["mediaType"],
        code: json["code"],
        mediaTypeArDesc: json["mediaTypeArDesc"],
        mediaTypeEnDesc: json["mediaTypeEnDesc"],
        value: json["value"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "agentId": agentId,
        "mediaType": mediaType,
        "code": code,
        "mediaTypeArDesc": mediaTypeArDesc,
        "mediaTypeEnDesc": mediaTypeEnDesc,
        "value": value,
        "active": active,
        "id": id,
      };
}
