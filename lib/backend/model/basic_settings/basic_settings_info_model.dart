
class BasicSettingsInfoModel {
  Message message;
  Data data;
  String type;

  BasicSettingsInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BasicSettingsInfoModel.fromJson(Map<String, dynamic> json) =>
      BasicSettingsInfoModel(
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
  BasicSettings basicSettings;
  BaseCur baseCur;
  WebLinks webLinks;
  List<Language> languages;
  ImagePaths imagePaths;

  Data({
    required this.basicSettings,
    required this.baseCur,
    required this.webLinks,
    required this.languages,
    required this.imagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basicSettings: BasicSettings.fromJson(json["basic_settings"]),
        baseCur: BaseCur.fromJson(json["base_cur"]),
        webLinks: WebLinks.fromJson(json["web_links"]),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "basic_settings": basicSettings.toJson(),
        "base_cur": baseCur.toJson(),
        "web_links": webLinks.toJson(),
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "image_paths": imagePaths.toJson(),
      };
}

class BaseCur {
  int id;
  String code;
  String symbol;
  String rate;
  bool both;
  bool senderCurrency;
  bool receiverCurrency;

  BaseCur({
    required this.id,
    required this.code,
    required this.symbol,
    required this.rate,
    required this.both,
    required this.senderCurrency,
    required this.receiverCurrency,
  });

  factory BaseCur.fromJson(Map<String, dynamic> json) => BaseCur(
        id: json["id"],
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        both: json["both"],
        senderCurrency: json["senderCurrency"],
        receiverCurrency: json["receiverCurrency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "both": both,
        "senderCurrency": senderCurrency,
        "receiverCurrency": receiverCurrency,
      };
}

class BasicSettings {
  int id;
  String siteName;
  String siteTitle;
  String baseColor;
  String secondaryColor;
  String timezone;
  String siteLogo;
  String siteLogoDark;
  String siteFav;
  String siteFavDark;

  BasicSettings({
    required this.id,
    required this.siteName,
    required this.siteTitle,
    required this.baseColor,
    required this.secondaryColor,
    required this.timezone,
    required this.siteLogo,
    required this.siteLogoDark,
    required this.siteFav,
    required this.siteFavDark,
  });

  factory BasicSettings.fromJson(Map<String, dynamic> json) => BasicSettings(
        id: json["id"],
        siteName: json["site_name"],
        siteTitle: json["site_title"],
        baseColor: json["base_color"],
        secondaryColor: json["secondary_color"],
        timezone: json["timezone"],
        siteLogo: json["site_logo"],
        siteLogoDark: json["site_logo_dark"],
        siteFav: json["site_fav"],
        siteFavDark: json["site_fav_dark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "site_name": siteName,
        "site_title": siteTitle,
        "base_color": baseColor,
        "secondary_color": secondaryColor,
        "timezone": timezone,
        "site_logo": siteLogo,
        "site_logo_dark": siteLogoDark,
        "site_fav": siteFav,
        "site_fav_dark": siteFavDark,
      };
}

class ImagePaths {
  String basePath;
  String pathLocation;
  String defaultImage;

  ImagePaths({
    required this.basePath,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
        basePath: json["base_path"],
        pathLocation: json["path_location"],
        defaultImage: json["default_image"],
      );

  Map<String, dynamic> toJson() => {
        "base_path": basePath,
        "path_location": pathLocation,
        "default_image": defaultImage,
      };
}

class Language {
  int id;
  String name;
  String code;
  bool status;

  Language({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "status": status,
      };
}

class WebLinks {
  String privacyPolicy;
  String aboutUs;
  String contactUs;
  String services;
  String webJournal;

  WebLinks({
    required this.privacyPolicy,
    required this.aboutUs,
    required this.contactUs,
    required this.services,
    required this.webJournal,
  });

  factory WebLinks.fromJson(Map<String, dynamic> json) => WebLinks(
        privacyPolicy: json["privacy-policy"],
        aboutUs: json["about-us"],
        contactUs: json["contact-us"],
        services: json["services"],
        webJournal: json["web-journal"],
      );

  Map<String, dynamic> toJson() => {
        "privacy-policy": privacyPolicy,
        "about-us": aboutUs,
        "contact-us": contactUs,
        "services": services,
        "web-journal": webJournal,
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
