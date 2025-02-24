
// ignore_for_file: constant_identifier_names

class TransactionModel {
  Message message;
  Data data;
  String type;

  TransactionModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
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
  List<TransactionTypeElement> transactionTypes;
  List<Transaction> transactions;

  Data({
    required this.instructions,
    required this.transactionTypes,
    required this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructions: Instructions.fromJson(json["instructions"]),
        transactionTypes: List<TransactionTypeElement>.from(
            json["transaction_types"]
                .map((x) => transactionTypeElementValues.map[x]!)),
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "instructions": instructions.toJson(),
        "transaction_types": List<dynamic>.from(transactionTypes
            .map((x) => transactionTypeElementValues.reverse[x])),
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Instructions {
  String slug;
  String status;

  Instructions({
    required this.slug,
    required this.status,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "status": status,
      };
}

enum TransactionTypeElement { TRANSFER_MONEY }

final transactionTypeElementValues =
    EnumValues({"TRANSFER-MONEY": TransactionTypeElement.TRANSFER_MONEY});

class Transaction {
  int id;
  String trxId;
  TransactionTypeElement type;
  String senderGatewayName;
  String senderAmount;
  String senderCurrency;
  String receiverGatewayName;
  String receiverAmount;
  String receiverCurrency;
  bool confirm;
  List<DynamicInput> dynamicInputs;
  dynamic confirmUrl;
  String statusValue;
  int status;
  DateTime createdAt;

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
    required this.confirm,
    required this.dynamicInputs,
    required this.confirmUrl,
    required this.statusValue,
    required this.status,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        trxId: json["trx_id"],
        type: transactionTypeElementValues.map[json["type"]]!,
        senderGatewayName: json["sender_gateway_name"],
        senderAmount: json["sender_amount"],
        senderCurrency: json["sender_currency"],
        receiverGatewayName:
        json["receiver_gateway_name"],
        receiverAmount: json["receiver_amount"],
        receiverCurrency:
        json["receiver_currency"],
        confirm: json["confirm"],
        dynamicInputs: List<DynamicInput>.from(
            json["dynamic_inputs"].map((x) => DynamicInput.fromJson(x))),
        confirmUrl: json["confirm_url"],
        statusValue: json["status_value"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx_id": trxId,
        "type": transactionTypeElementValues.reverse[type],
        "sender_gateway_name": senderGatewayName,
        "sender_amount": senderAmount,
        "sender_currency": senderCurrencyValues.reverse[senderCurrency],
        "receiver_gateway_name":
            receiverGatewayNameValues.reverse[receiverGatewayName],
        "receiver_amount": receiverAmount,
        "receiver_currency": receiverCurrencyValues.reverse[receiverCurrency],
        "confirm": confirm,
        "dynamic_inputs":
            List<dynamic>.from(dynamicInputs.map((x) => x.toJson())),
        "confirm_url": confirmUrl,
        "status_value": statusValueValues.reverse[statusValue],
        "status": status,
        "created_at": createdAt.toIso8601String(),
      };
}

class DynamicInput {
  DynamicInputType type;
  Label label;
  Placeholder placeholder;
  Name name;
  bool required;
  Validation validation;

  DynamicInput({
    required this.type,
    required this.label,
    required this.placeholder,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory DynamicInput.fromJson(Map<String, dynamic> json) => DynamicInput(
        type: dynamicInputTypeValues.map[json["type"]]!,
        label: labelValues.map[json["label"]]!,
        placeholder: placeholderValues.map[json["placeholder"]]!,
        name: nameValues.map[json["name"]]!,
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": dynamicInputTypeValues.reverse[type],
        "label": labelValues.reverse[label],
        "placeholder": placeholderValues.reverse[placeholder],
        "name": nameValues.reverse[name],
        "required": required,
        "validation": validation.toJson(),
      };
}

enum Label { TXN_HASH }

final labelValues = EnumValues({"Txn Hash": Label.TXN_HASH});

enum Name { TXN_HASH }

final nameValues = EnumValues({"txn_hash": Name.TXN_HASH});

enum Placeholder { ENTER_TXN_HASH }

final placeholderValues =
    EnumValues({"Enter Txn Hash": Placeholder.ENTER_TXN_HASH});

enum DynamicInputType { TEXT }

final dynamicInputTypeValues = EnumValues({"text": DynamicInputType.TEXT});

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

enum ReceiverCurrency { INR, USD }

final receiverCurrencyValues =
    EnumValues({"INR": ReceiverCurrency.INR, "USD": ReceiverCurrency.USD});

enum ReceiverGatewayName { PAY_PAL_USD, PHONE_PE_INR, UPI_INR }

final receiverGatewayNameValues = EnumValues({
  "PayPal USD": ReceiverGatewayName.PAY_PAL_USD,
  "PhonePe INR": ReceiverGatewayName.PHONE_PE_INR,
  "UPI INR": ReceiverGatewayName.UPI_INR
});

enum SenderCurrency { BDT, BTC, NPR, USD }

final senderCurrencyValues = EnumValues({
  "BDT": SenderCurrency.BDT,
  "BTC": SenderCurrency.BTC,
  "NPR": SenderCurrency.NPR,
  "USD": SenderCurrency.USD
});

enum StatusValue { PAYMENT_SUCCESS, PENDING, WAITING }

final statusValueValues = EnumValues({
  "Payment Success": StatusValue.PAYMENT_SUCCESS,
  "Pending": StatusValue.PENDING,
  "Waiting": StatusValue.WAITING
});

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
