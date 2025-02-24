
// ignore_for_file: constant_identifier_names

class NotificationInfoModel {
  NotificationInfoModelMessage message;
  Data data;
  String type;

  NotificationInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory NotificationInfoModel.fromJson(Map<String, dynamic> json) =>
      NotificationInfoModel(
        message: NotificationInfoModelMessage.fromJson(json["message"]),
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
  List<Notifications> notifications;

  Data({
    required this.notifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: List<Notifications>.from(
            json["notifications"].map((x) => Notifications.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notifications {
  int id;
  Type type;
  NotificationMessage message;
  DateTime createdAt;

  Notifications({
    required this.id,
    required this.type,
    required this.message,
    required this.createdAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        type: typeValues.map[json["type"]]!,
        message: NotificationMessage.fromJson(json["message"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "message": message.toJson(),
        "created_at": createdAt.toIso8601String(),
      };
}

class NotificationMessage {
  String title;
  String message;
  String image;

  NotificationMessage({
    required this.title,
    required this.message,
    required this.image,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) =>
      NotificationMessage(
        title:json["title"],
        message: json["message"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title":title,
        "message": message,
        "image": image,
      };
}

enum Title { TRANSFER_MONEY }

final titleValues = EnumValues({"Transfer Money": Title.TRANSFER_MONEY});

enum Type { TRANSFER_MONEY }

final typeValues = EnumValues({"TRANSFER-MONEY": Type.TRANSFER_MONEY});

class NotificationInfoModelMessage {
  List<String> success;

  NotificationInfoModelMessage({
    required this.success,
  });

  factory NotificationInfoModelMessage.fromJson(Map<String, dynamic> json) =>
      NotificationInfoModelMessage(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
