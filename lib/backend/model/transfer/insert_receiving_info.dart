
class InsertReceivingInfoModel {
  Message message;
  Data data;
  String type;

  InsertReceivingInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory InsertReceivingInfoModel.fromJson(Map<String, dynamic> json) =>
      InsertReceivingInfoModel(
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
  String identifier;
  String sendingMethod;
  String receivingMethod;
  List<ReceivingInfo> receivingInfo;
  String senderAmount;
  String senderCurrency;
  String exchangeRate;
  String receiverAmount;
  String receiverCurrency;
  String totalCharge;
  String payable;

  Data({
    required this.identifier,
    required this.sendingMethod,
    required this.receivingMethod,
    required this.receivingInfo,
    required this.senderAmount,
    required this.senderCurrency,
    required this.exchangeRate,
    required this.receiverAmount,
    required this.receiverCurrency,
    required this.totalCharge,
    required this.payable,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        identifier: json["identifier"],
        sendingMethod: json["sending_method"],
        receivingMethod: json["receiving_method"],
        receivingInfo: List<ReceivingInfo>.from(
            json["receiving_info"].map((x) => ReceivingInfo.fromJson(x))),
        senderAmount: json["sender_amount"],
        senderCurrency: json["sender_currency"],
        exchangeRate: json["exchange_rate"],
        receiverAmount: json["receiver_amount"],
        receiverCurrency: json["receiver_currency"],
        totalCharge: json["total_charge"],
        payable: json["payable"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "sending_method": sendingMethod,
        "receiving_method": receivingMethod,
        "receiving_info":
            List<dynamic>.from(receivingInfo.map((x) => x.toJson())),
        "sender_amount": senderAmount,
        "sender_currency": senderCurrency,
        "exchange_rate": exchangeRate,
        "receiver_amount": receiverAmount,
        "receiver_currency": receiverCurrency,
        "total_charge": totalCharge,
        "payable": payable,
      };
}

class ReceivingInfo {
  String type;
  String label;
  String name;
  bool required;
  Validation validation;
  String value;

  ReceivingInfo({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
    required this.value,
  });

  factory ReceivingInfo.fromJson(Map<String, dynamic> json) => ReceivingInfo(
        type: json["type"],
        label: json["label"],
        name: json["name"],
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
        "value": value,
      };
}

class Validation {
  String max;
  List<dynamic> mimes;
  String min;
  List<dynamic> options;
  bool required;

  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        max: json["max"],
        mimes: List<dynamic>.from(json["mimes"].map((x) => x)),
        min: json["min"],
        options: List<dynamic>.from(json["options"].map((x) => x)),
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "mimes": List<dynamic>.from(mimes.map((x) => x)),
        "min": min,
        "options": List<dynamic>.from(options.map((x) => x)),
        "required": required,
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
