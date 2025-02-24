
class ManualConfirmModel {
  Message message;
  Data data;
  String type;

  ManualConfirmModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ManualConfirmModel.fromJson(Map<String, dynamic> json) =>
      ManualConfirmModel(
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
  String transactionTrx;

  Data({
    required this.transactionTrx,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionTrx: json["transaction_trx"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_trx": transactionTrx,
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
