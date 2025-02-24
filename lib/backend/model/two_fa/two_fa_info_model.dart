// To parse this JSON data, do
//
//     final twoFaInfoModel = twoFaInfoModelFromJson(jsonString);

import 'dart:convert';

TwoFaInfoModel twoFaInfoModelFromJson(String str) =>
    TwoFaInfoModel.fromJson(json.decode(str));

String twoFaInfoModelToJson(TwoFaInfoModel data) => json.encode(data.toJson());

class TwoFaInfoModel {
  Message message;
  TwoFaInfoModelData data;
  String type;

  TwoFaInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TwoFaInfoModel.fromJson(Map<String, dynamic> json) => TwoFaInfoModel(
        message: Message.fromJson(json["message"]),
        data: TwoFaInfoModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class TwoFaInfoModelData {
  DataData data;

  TwoFaInfoModelData({
    required this.data,
  });

  factory TwoFaInfoModelData.fromJson(Map<String, dynamic> json) =>
      TwoFaInfoModelData(
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataData {
  String qrCode;
  String qrSecrete;
  int qrStatus;
  String alert;

  DataData({
    required this.qrCode,
    required this.qrSecrete,
    required this.qrStatus,
    required this.alert,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        qrCode: json["qr_code"],
        qrSecrete: json["qr_secrete"],
        qrStatus: json["qr_status"],
        alert: json["alert"],
      );

  Map<String, dynamic> toJson() => {
        "qr_code": qrCode,
        "qr_secrete": qrSecrete,
        "qr_status": qrStatus,
        "alert": alert,
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
