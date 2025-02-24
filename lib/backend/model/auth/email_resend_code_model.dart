
class EmailResendCodeModel {
  Message message;
  Data data;
  String type;

  EmailResendCodeModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory EmailResendCodeModel.fromJson(Map<String, dynamic> json) =>
      EmailResendCodeModel(
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
  String code;
  String token;
  String waitTime;

  Data({
    required this.code,
    required this.token,
    required this.waitTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
        token: json["token"],
        waitTime: json["wait_time"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "token": token,
        "wait_time": waitTime,
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
