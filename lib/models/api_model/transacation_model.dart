class Transaction {
  String? status;
  List<Data?>? data;

  Transaction({this.status, this.data});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    status: json['status'],
    data: (json['data'] as List<dynamic>?)
        ?.map((v) => Data.fromJson(v as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data?.map((v) => v?.toJson()).toList(),
  };
}

class Data {
  String? type;
  double? amount;
  String? phoneNumber;
  String? created;
  double? balance;

  Data({this.type, this.amount, this.phoneNumber, this.created, this.balance});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json['type'],
    amount: json['amount']?.toDouble(),
    phoneNumber: json['phoneNumber'],
    created: json['created'],
    balance: json['balance']?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'amount': amount,
    'phoneNumber': phoneNumber,
    'created': created,
    'balance': balance,
  };
}