
class SplashModel {
  Message message;
  Data data;
  String type;

  SplashModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory SplashModel.fromJson(Map<String, dynamic> json) => SplashModel(
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
  SplashScreen splashScreen;
  ImagePaths imagePaths;

  Data({
    required this.splashScreen,
    required this.imagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        splashScreen: SplashScreen.fromJson(json["splash_screen"]),
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "splash_screen": splashScreen.toJson(),
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

class SplashScreen {
  Mobile mobile;
  Tab tab;

  SplashScreen({
    required this.mobile,
    required this.tab,
  });

  factory SplashScreen.fromJson(Map<String, dynamic> json) => SplashScreen(
        mobile: Mobile.fromJson(json["mobile"]),
        tab: Tab.fromJson(json["tab"]),
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile.toJson(),
        "tab": tab.toJson(),
      };
}

class Mobile {
  String image;
  String version;

  Mobile({
    required this.image,
    required this.version,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        image: json["image"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "version": version,
      };
}

class Tab {
  String image;
  String tabVersion;

  Tab({
    required this.image,
    required this.tabVersion,
  });

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
        image: json["image"],
        tabVersion: json["tab_version"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "tab_version": tabVersion,
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
