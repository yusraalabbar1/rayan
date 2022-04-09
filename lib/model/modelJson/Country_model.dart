// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Country {
  Country({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<InfoCountry> data;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<InfoCountry>.from(
            json["data"].map((x) => InfoCountry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InfoCountry {
  InfoCountry({
    required this.id,
    required this.countryDescAr,
    required this.countryDescEn,
    required this.countryCode,
    required this.countryFlag,
    required this.active,
    required this.cities,
  });

  int id;
  String countryDescAr;
  String countryDescEn;
  String countryCode;
  String countryFlag;
  bool active;
  List<City> cities;

  factory InfoCountry.fromJson(Map<String, dynamic> json) => InfoCountry(
        id: json["id"],
        countryDescAr: json["countryDescAr"],
        countryDescEn: json["countryDescEn"],
        countryCode: json["countryCode"],
        countryFlag: json["countryFlag"],
        active: json["active"],
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "countryDescAr": countryDescAr,
        "countryDescEn": countryDescEn,
        "countryCode": countryCode,
        "countryFlag": countryFlag,
        "active": active,
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  City({
    required this.cityId,
    required this.cityDescAr,
    required this.cityDescEn,
    required this.countryId,
    required this.active,
  });

  int cityId;
  String cityDescAr;
  String cityDescEn;
  int countryId;
  bool active;

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityId: json["cityId"],
        cityDescAr: json["cityDescAr"],
        cityDescEn: json["cityDescEn"],
        countryId: json["countryId"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "cityId": cityId,
        "cityDescAr": cityDescAr,
        "cityDescEn": cityDescEn,
        "countryId": countryId,
        "active": active,
      };
}
