class TrackModel {
  Message message;
  Data data;
  String type;

  TrackModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
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
  Instructions instructions;
  Transaction transaction;

  Data({
    required this.instructions,
    required this.transaction,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructions: Instructions.fromJson(json["instructions"]),
        transaction: Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "instructions": instructions.toJson(),
        "transaction": transaction.toJson(),
      };
}

class Instructions {
  String status;

  Instructions({
    required this.status,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

class Transaction {
  int id;
  String trxId;
  String type;
  String senderGatewayName;
  String senderAmount;
  String senderCurrency;
  String receiverGatewayName;
  String receiverAmount;
  String receiverCurrency;
  String statusValue;
  String rejectReason;
  int status;
  String delayTime;
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? transferTime;
  DateTime? approvedTime;
  DateTime? rejectTime;

  Transaction({
    required this.id,
    required this.trxId,
    required this.type,
    required this.senderGatewayName,
    required this.senderAmount,
    required this.senderCurrency,
    required this.receiverGatewayName,
    required this.receiverAmount,
    required this.receiverCurrency,
    required this.statusValue,
    required this.rejectReason,
    required this.status,
    required this.delayTime,
    required this.createdAt,
    required this.updatedAt,
    required this.transferTime,
    required this.approvedTime,
    required this.rejectTime,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        trxId: json["trx_id"],
        type: json["type"],
        senderGatewayName: json["sender_gateway_name"],
        senderAmount: json["sender_amount"],
        senderCurrency: json["sender_currency"],
        receiverGatewayName: json["receiver_gateway_name"],
        receiverAmount: json["receiver_amount"],
        receiverCurrency: json["receiver_currency"],
        statusValue: json["status_value"],
        rejectReason: json["reject_reason"],
        status: json["status"],
        delayTime: json["delay_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        transferTime: json["transfer_time"] != null
            ? DateTime.parse(json["transfer_time"])
            : null,
        approvedTime: json["approved_time"] != null
            ? DateTime.parse(json["approved_time"])
            : null,
        rejectTime: json["reject_time"] != null
            ? DateTime.parse(json["reject_time"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx_id": trxId,
        "type": type,
        "sender_gateway_name": senderGatewayName,
        "sender_amount": senderAmount,
        "sender_currency": senderCurrency,
        "receiver_gateway_name": receiverGatewayName,
        "receiver_amount": receiverAmount,
        "receiver_currency": receiverCurrency,
        "status_value": statusValue,
        "reject_reason": rejectReason,
        "status": status,
        "delay_time": delayTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "transfer_time": transferTime?.toIso8601String(),
        "approved_time": approvedTime?.toIso8601String(),
        "reject_time": rejectTime?.toIso8601String(),
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
