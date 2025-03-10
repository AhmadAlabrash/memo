
class ManualDynamicInputModel {
  Message message;
  Data data;
  String type;

  ManualDynamicInputModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ManualDynamicInputModel.fromJson(Map<String, dynamic> json) =>
      ManualDynamicInputModel(
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
  Gateway gateway;
  List<InputField> inputFields;
  SenderGatewayAlias senderGatewayAlias;

  Data({
    required this.identifier,
    required this.gateway,
    required this.inputFields,
    required this.senderGatewayAlias,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        identifier: json["identifier"],
        gateway: Gateway.fromJson(json["gateway"]),
        inputFields: List<InputField>.from(
            json["input_fields"].map((x) => InputField.fromJson(x))),
        senderGatewayAlias:
            SenderGatewayAlias.fromJson(json["sender_gateway_alias"]),
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "gateway": gateway.toJson(),
        "input_fields": List<dynamic>.from(inputFields.map((x) => x.toJson())),
        "sender_gateway_alias": senderGatewayAlias.toJson(),
      };
}

class Gateway {
  String desc;

  Gateway({
    required this.desc,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
      };
}

class InputField {
  String type;
  String label;
  String name;
  bool required;
  Validation validation;

  InputField({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory InputField.fromJson(Map<String, dynamic> json) => InputField(
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
  dynamic max;
  List<String> mimes;
  dynamic min;
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
        max: json["max"]??"",
        mimes: List<String>.from(json["mimes"].map((x) => x)),
        min: json["min"]??"",
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

class SenderGatewayAlias {
  String alias;

  SenderGatewayAlias({
    required this.alias,
  });

  factory SenderGatewayAlias.fromJson(Map<String, dynamic> json) =>
      SenderGatewayAlias(
        alias: json["alias"],
      );

  Map<String, dynamic> toJson() => {
        "alias": alias,
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
