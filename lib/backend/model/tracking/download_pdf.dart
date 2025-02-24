
class ExportPdfModel {
  Message message;
  Data data;
  String type;

  ExportPdfModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ExportPdfModel.fromJson(Map<String, dynamic> json) => ExportPdfModel(
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
  String downloadLink;

  Data({
    required this.downloadLink,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        downloadLink: json["download_link"],
      );

  Map<String, dynamic> toJson() => {
        "download_link": downloadLink,
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
