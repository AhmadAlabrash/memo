
class SubmitAutomaticGatewayModel {
  Message message;
  Data data;
  String type;

  SubmitAutomaticGatewayModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory SubmitAutomaticGatewayModel.fromJson(Map<String, dynamic> json) =>
      SubmitAutomaticGatewayModel(
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
  String redirectUrl;
  List<dynamic> redirectLinks;
  String actionType;
  List<dynamic> addressInfo;

  Data({
    required this.redirectUrl,
    required this.redirectLinks,
    required this.actionType,
    required this.addressInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        redirectUrl: json["redirect_url"],
        redirectLinks: List<dynamic>.from(json["redirect_links"].map((x) => x)),
        actionType: json["action_type"],
        addressInfo: List<dynamic>.from(json["address_info"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "redirect_url": redirectUrl,
        "redirect_links": List<dynamic>.from(redirectLinks.map((x) => x)),
        "action_type": actionType,
        "address_info": List<dynamic>.from(addressInfo.map((x) => x)),
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
