import 'dart:convert';

class Client {
  int? clientId;
  String? clientName;
  int? accountBalance;

  Client({this.clientId, this.clientName, this.accountBalance});

  Client copyWith({int? clientId, String? clientName, int? accountBalance}) {
    return Client(
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      accountBalance: accountBalance ?? this.accountBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'clientName': clientName,
      'accountBalance': accountBalance,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      clientId: map['clientId'],
      clientName: map['clientName'],
      accountBalance: map['accountBalance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

  @override
  String toString() =>
      'Client(clientId: $clientId, clientName: $clientName, accountBalance: $accountBalance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Client &&
        other.clientId == clientId &&
        other.clientName == clientName &&
        other.accountBalance == accountBalance;
  }

  @override
  int get hashCode =>
      clientId.hashCode ^ clientName.hashCode ^ accountBalance.hashCode;
}
