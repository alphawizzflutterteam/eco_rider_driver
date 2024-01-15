
class TranjectionModel {
  bool error;
  String message;
  String balance;
  List<TranjectionListtt> data;

  TranjectionModel({
    required this.error,
    required this.message,
    required this.balance,
    required this.data,
  });

  factory TranjectionModel.fromJson(Map<String, dynamic> json) => TranjectionModel(
    error: json["error"],
    message: json["message"],
    balance: json["balance"],
    data: List<TranjectionListtt>.from(json["data"].map((x) => TranjectionListtt.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "balance": balance,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TranjectionListtt {
  String id;
  String transactionType;
  String userId;
  String orderId;
  String orderItemId;
  String type;
  String txnId;
  String payuTxnId;
  String amount;
  String status;
  String currencyCode;
  String payerEmail;
  String message;
  DateTime transactionDate;
  DateTime dateCreated;
  String isRefund;

  TranjectionListtt({
    required this.id,
    required this.transactionType,
    required this.userId,
    required this.orderId,
    required this.orderItemId,
    required this.type,
    required this.txnId,
    required this.payuTxnId,
    required this.amount,
    required this.status,
    required this.currencyCode,
    required this.payerEmail,
    required this.message,
    required this.transactionDate,
    required this.dateCreated,
    required this.isRefund,
  });

  factory TranjectionListtt.fromJson(Map<String, dynamic> json) => TranjectionListtt(
    id: json["id"].toString(),
    transactionType: json["transaction_type"].toString(),
    userId: json["user_id"].toString(),
    orderId: json["order_id"].toString(),
    orderItemId: json["order_item_id"].toString(),
    type: json["type"].toString(),
    txnId: json["txn_id"].toString(),
    payuTxnId: json["payu_txn_id"].toString(),
    amount: json["amount"].toString(),
    status: json["status"].toString(),
    currencyCode: json["currency_code"].toString(),
    payerEmail: json["payer_email"].toString(),
    message: json["message"].toString(),
    transactionDate: DateTime.parse(json["transaction_date"]),
    dateCreated: DateTime.parse(json["date_created"]),
    isRefund: json["is_refund"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_type": transactionType,
    "user_id": userId,
    "order_id": orderId,
    "order_item_id": orderItemId,
    "type": type,
    "txn_id": txnId,
    "payu_txn_id": payuTxnId,
    "amount": amount,
    "status": status,
    "currency_code": currencyCode,
    "payer_email": payerEmail,
    "message": message,
    "transaction_date": transactionDate.toIso8601String(),
    "date_created": dateCreated.toIso8601String(),
    "is_refund": isRefund,
  };
}
