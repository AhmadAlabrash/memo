
class DashboardModel {
  Message message;
  Data data;
  String type;

  DashboardModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
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
  UserInfo userInfo;
  ProfileImagePaths profileImagePaths;
  String baseCurrencyCode;
  String totalTransferMoney;
  String totalTransactions;
  int activeTickets;

  Data({
    required this.userInfo,
    required this.profileImagePaths,
    required this.baseCurrencyCode,
    required this.totalTransferMoney,
    required this.totalTransactions,
    required this.activeTickets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userInfo: UserInfo.fromJson(json["user_info"]),
        profileImagePaths:
            ProfileImagePaths.fromJson(json["profile_image_paths"]),
        baseCurrencyCode: json["base_currency_code"],
        totalTransferMoney: json["total_transfer_money"],
        totalTransactions: json["total_transactions"],
        activeTickets: json["active_tickets"],
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo.toJson(),
        "profile_image_paths": profileImagePaths.toJson(),
        "base_currency_code": baseCurrencyCode,
        "total_transfer_money": totalTransferMoney,
        "total_transactions": totalTransactions,
        "active_tickets": activeTickets,
      };
}

class ProfileImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ProfileImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ProfileImagePaths.fromJson(Map<String, dynamic> json) =>
      ProfileImagePaths(
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

class UserInfo {
  int id;
  String firstname;
  String lastname;
  String fullname;
  String username;
  String email;
  dynamic image;
  dynamic mobileCode;
  dynamic mobile;
  dynamic fullMobile;
  int emailVerified;
  int twoFactorVerified;
  int twoFactorStatus;
  dynamic twoFactorSecret;

  UserInfo({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.fullname,
    required this.username,
    required this.email,
    required this.image,
    required this.mobileCode,
    required this.mobile,
    required this.fullMobile,
    required this.emailVerified,
    required this.twoFactorVerified,
    required this.twoFactorStatus,
    required this.twoFactorSecret,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        fullname: json["fullname"],
        username: json["username"],
        email: json["email"],
        image: json["image"]??"",
        mobileCode: json["mobile_code"]??"",
        mobile: json["mobile"]??"",
        fullMobile: json["full_mobile"]??'',
        emailVerified: json["email_verified"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"],
        twoFactorSecret: json["two_factor_secret"]??'',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "fullname": fullname,
        "username": username,
        "email": email,
        "image": image,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "full_mobile": fullMobile,
        "email_verified": emailVerified,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "two_factor_secret": twoFactorSecret,
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
