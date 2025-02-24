// ignore_for_file: constant_identifier_names

import '/widgets/others/custom_dropdown.dart';

class PaymentGatewayModel {
  Message message;
  Data data;
  String type;

  PaymentGatewayModel({
    required this.message,
    required this.data,
    required this.type,
  });
  factory PaymentGatewayModel.fromJson(Map<String, dynamic> json) =>
      PaymentGatewayModel(
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
  ImagePaths imagePaths;
  List<ErGateway> senderGateways;
  List<ErGateway> receiverGateways;

  Data({
    required this.imagePaths,
    required this.senderGateways,
    required this.receiverGateways,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
        senderGateways: List<ErGateway>.from(
            json["sender_gateways"].map((x) => ErGateway.fromJson(x))),
        receiverGateways: List<ErGateway>.from(
            json["receiver_gateways"].map((x) => ErGateway.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "image_paths": imagePaths.toJson(),
        "sender_gateways":
            List<dynamic>.from(senderGateways.map((x) => x.toJson())),
        "receiver_gateways":
            List<dynamic>.from(receiverGateways.map((x) => x.toJson())),
      };
}

class ImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
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

class ErGateway {
  int id;
  Slug slug;
  Type type;
  String name;
  bool crypto;
  dynamic desc;
  dynamic delayTime;
  bool status;
  List<Currency> currencies;

  ErGateway({
    required this.id,
    required this.slug,
    required this.type,
    required this.name,
    required this.crypto,
    this.desc,
    this.delayTime,
    required this.status,
    required this.currencies,
  });

  factory ErGateway.fromJson(Map<String, dynamic> json) => ErGateway(
        id: json["id"],
        slug: slugValues.map[json["slug"]]!,
        type: typeValues.map[json["type"]]!,
        name: json["name"],
        crypto: json["crypto"],
        desc: json["desc"] ?? "",
        delayTime: json["delay_time"] ?? "",
        status: json["status"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slugValues.reverse[slug],
        "type": typeValues.reverse[type],
        "name": name,
        "crypto": crypto,
        "desc": desc,
        "delay_time": delayTime,
        "status": status,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency implements DropdownModel {
  int id;
  @override
  int paymentGatewayId;
  String name;
  String alias;
  String currencyCode;
  dynamic currencySymbol;
  dynamic image;
  String minLimit;
  String maxLimit;
  String percentCharge;
  String fixedCharge;
  String rate;
  DateTime createdAt;
  DateTime updatedAt;


  Currency({
    required this.id,
    required this.paymentGatewayId,
    required this.name,
    required this.alias,
    required this.currencyCode,
    this.currencySymbol,
    this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        name: json["name"],
        alias: json["alias"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"] ?? "",
        image: json["image"] ?? "",
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
        percentCharge: json["percent_charge"],
        fixedCharge: json["fixed_charge"],
        rate: json["rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_gateway_id": paymentGatewayId,
        "name": name,
        "alias": alias,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "image": image,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  String get img => image;
  @override
  String get title => name;
}

class CurrencyReceiver implements DropdownModel {
  int id;
  @override
  int paymentGatewayId;
  String name;
  String alias;
  String currencyCode;
  String? currencySymbol;
  dynamic image;
  String minLimit;
  String maxLimit;
  String percentCharge;
  String fixedCharge;
  String rate;
  DateTime createdAt;
  DateTime updatedAt;

  CurrencyReceiver({
    required this.id,
    required this.paymentGatewayId,
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurrencyReceiver.fromJson(Map<String, dynamic> json) =>
      CurrencyReceiver(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        name: json["name"],
        alias: json["alias"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        image: json["image"] ?? "",
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
        percentCharge: json["percent_charge"],
        fixedCharge: json["fixed_charge"],
        rate: json["rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_gateway_id": paymentGatewayId,
        "name": name,
        "alias": alias,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "image": image,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  String get img => image;
  @override
  String get title => name;
}

enum Slug { ADD_MONEY, MONEY_OUT }

final slugValues =
    EnumValues({"add-money": Slug.ADD_MONEY, "money-out": Slug.MONEY_OUT});

enum Type { AUTOMATIC, MANUAL }

final typeValues =
    EnumValues({"AUTOMATIC": Type.AUTOMATIC, "MANUAL": Type.MANUAL});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
