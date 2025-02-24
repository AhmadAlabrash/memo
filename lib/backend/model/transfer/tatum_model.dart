// To parse this JSON data, do
//
//     final tatumDynamicModel = tatumDynamicModelFromJson(jsonString);

import 'dart:convert';

TatumDynamicModel tatumDynamicModelFromJson(String str) =>
    TatumDynamicModel.fromJson(json.decode(str));

String tatumDynamicModelToJson(TatumDynamicModel data) =>
    json.encode(data.toJson());

class TatumDynamicModel {
  Message message;
  Data data;
  String type;

  TatumDynamicModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TatumDynamicModel.fromJson(Map<String, dynamic> json) =>
      TatumDynamicModel(
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
  bool redirectUrl;
  List<dynamic> redirectLinks;
  String actionType;
  AddressInfo addressInfo;

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
        addressInfo: AddressInfo.fromJson(json["address_info"]),
      );

  Map<String, dynamic> toJson() => {
        "redirect_url": redirectUrl,
        "redirect_links": List<dynamic>.from(redirectLinks.map((x) => x)),
        "action_type": actionType,
        "address_info": addressInfo.toJson(),
      };
}

class AddressInfo {
  String coin;
  String address;
  List<InputField> inputFields;
  String submitUrl;

  AddressInfo({
    required this.coin,
    required this.address,
    required this.inputFields,
    required this.submitUrl,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) => AddressInfo(
        coin: json["coin"],
        address: json["address"],
        inputFields: List<InputField>.from(
            json["input_fields"].map((x) => InputField.fromJson(x))),
        submitUrl: json["submit_url"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "address": address,
        "input_fields": List<dynamic>.from(inputFields.map((x) => x.toJson())),
        "submit_url": submitUrl,
      };
}

class InputField {
  String type;
  String label;
  String placeholder;
  String name;
  bool required;
  Validation validation;

  InputField({
    required this.type,
    required this.label,
    required this.placeholder,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory InputField.fromJson(Map<String, dynamic> json) => InputField(
        type: json["type"],
        label: json["label"],
        placeholder: json["placeholder"],
        name: json["name"],
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "placeholder": placeholder,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
      };
}

class Validation {
  String min;
  String max;
  bool required;

  Validation({
    required this.min,
    required this.max,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        min: json["min"],
        max: json["max"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
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
