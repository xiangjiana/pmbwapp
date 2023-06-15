class DepositBank {
  final String? bankCode;
  final String? bankName;

  DepositBank(this.bankCode, this.bankName);

  factory DepositBank.fromJson(Map<String, dynamic> json) {
    return DepositBank(
      json["bankCode"],
      json["bankName"],
    );
  }
}
