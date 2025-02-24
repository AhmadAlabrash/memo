
class InitialTransferModel {
  Message message;
  Data data;
  String type;

  InitialTransferModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory InitialTransferModel.fromJson(Map<String, dynamic> json) =>
      InitialTransferModel(
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
  String senderAmount;
  String senderCurrency;
  String receivingMethod;
  String receiverAmount;
  String receiverCurrency;
  List<ReceiverInputField> receiverInputFields;

  Data({
    required this.identifier,
    required this.sendingMethod,
    required this.senderAmount,
    required this.senderCurrency,
    required this.receivingMethod,
    required this.receiverAmount,
    required this.receiverCurrency,
    required this.receiverInputFields,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        identifier: json["identifier"],
        sendingMethod: json["sending_method"],
        senderAmount: json["sender_amount"],
        senderCurrency: json["sender_currency"],
        receivingMethod: json["receiving_method"],
        receiverAmount: json["receiver_amount"],
        receiverCurrency: json["receiver_currency"],
        receiverInputFields: List<ReceiverInputField>.from(
            json["receiver_input_fields"]
                .map((x) => ReceiverInputField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "sending_method": sendingMethod,
        "sender_amount": senderAmount,
        "sender_currency": senderCurrency,
        "receiving_method": receivingMethod,
        "receiver_amount": receiverAmount,
        "receiver_currency": receiverCurrency,
        "receiver_input_fields":
            List<dynamic>.from(receiverInputFields.map((x) => x.toJson())),
      };
}

class ReceiverInputField {
  String type;
  String label;
  String name;
  bool required;
  Validation validation;

  ReceiverInputField({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory ReceiverInputField.fromJson(Map<String, dynamic> json) =>
      ReceiverInputField(
        type: json["type"],
        label: json["label"],
        name: json["name"],
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
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
