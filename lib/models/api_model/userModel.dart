class UserData {
  String status;
  String message;
  List<UserAccount> data;

  UserData({required this.status, required this.message, required this.data});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => UserAccount.fromJson(item))
          .toList(),
    );
  }
}

class UserAccount {
  dynamic phoneNumber;
  dynamic  balance;
  String created;

  UserAccount({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      phoneNumber: json['phoneNumber']??'',
      balance: json['balance']??'',
      created: json['created']??"",
    );
  }
}