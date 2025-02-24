// To parse this JSON data, do
//
//     final onboardModel = onboardModelFromJson(jsonString);

import 'dart:convert';

OnboardModel onboardModelFromJson(String str) =>
    OnboardModel.fromJson(json.decode(str));

String onboardModelToJson(OnboardModel data) => json.encode(data.toJson());

class OnboardModel {
  Message message;
  Data data;
  String type;

  OnboardModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory OnboardModel.fromJson(Map<String, dynamic> json) => OnboardModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class Data {
  OnboardScreens onboardScreens;
  ImagePaths imagePaths;

  Data({
    required this.onboardScreens,
    required this.imagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        onboardScreens: OnboardScreens.fromJson(json["onboard_screens"]),
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "onboard_screens": onboardScreens.toJson(),
        "image_paths": imagePaths.toJson(),
      };
}

class ImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
        baseUrl: json["base_url"],
        pathLocation: json["path_location"],
        defaultImage: json["default_image"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "path_location": pathLocation,
        "default_image": defaultImage,
      };
}

class OnboardScreens {
  List<Mobile> mobile;
  List<Mobile> tab;

  OnboardScreens({
    required this.mobile,
    required this.tab,
  });

  factory OnboardScreens.fromJson(Map<String, dynamic> json) => OnboardScreens(
        mobile:
            List<Mobile>.from(json["mobile"].map((x) => Mobile.fromJson(x))),
        tab: List<Mobile>.from(json["tab"].map((x) => Mobile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mobile": List<dynamic>.from(mobile.map((x) => x.toJson())),
        "tab": List<dynamic>.from(tab.map((x) => x.toJson())),
      };
}

class Mobile {
  String title;
  String subTitle;
  String image;
  int status;

  Mobile({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.status,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        title: json["title"],
        subTitle: json["sub_title"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sub_title": subTitle,
        "image": image,
        "status": status,
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
