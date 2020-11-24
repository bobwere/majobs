import 'dart:convert';

SpBalance spBalanceFromJson(String str) => SpBalance.fromJson(json.decode(str));

String spBalanceToJson(SpBalance data) => json.encode(data.toJson());

class SpBalance {
  SpBalance({
    this.balance,
  });

  int balance;

  SpBalance copyWith({
    int balance,
  }) =>
      SpBalance(
        balance: balance ?? this.balance,
      );

  factory SpBalance.fromJson(Map<String, dynamic> json) => SpBalance(
        balance: json["Balance"] == null ? null : json["Balance"],
      );

  Map<String, dynamic> toJson() => {
        "Balance": balance == null ? null : balance,
      };
}
