class UiAccount {
  final String accountName;
  final String accountId;
  final String accountBalance;

  UiAccount(this.accountName, this.accountId, this.accountBalance);

  UiAccount copyWith({
    String? accountName,
    String? accountId,
    String? accountBalance,
  }) {
    if ((accountName == null || identical(accountName, this.accountName)) &&
        (accountId == null || identical(accountId, this.accountId)) &&
        (accountBalance == null ||
            identical(accountBalance, this.accountBalance))) {
      return this;
    }

    return UiAccount(
      accountName ?? this.accountName,
      accountId ?? this.accountId,
      accountBalance ?? this.accountBalance,
    );
  }

  @override
  String toString() {
    return 'UiAccount{accountName: $accountName, accountId: $accountId, balance: $accountBalance}';
  }
}
