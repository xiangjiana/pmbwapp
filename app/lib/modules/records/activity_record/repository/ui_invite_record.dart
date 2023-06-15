import 'dart:ui';

class UiInviteRecord {
  final String id;
  final String userName;
  final String registerTime;
  final String firstDeposit;
  final String bonus;
  final int status;
  final String statusTxt;
  final Color statusColor;

  UiInviteRecord(
    this.id,
    this.userName,
    this.registerTime,
    this.firstDeposit,
    this.bonus,
    this.status,
    this.statusTxt,
    this.statusColor,
  );

  UiInviteRecord copyWith({
    String? id,
    String? userName,
    String? registerTime,
    String? firstDeposit,
    String? bonus,
    int? status,
    String? statusTxt,
    Color? statusColor,
  }) {
    return UiInviteRecord(
      id ?? this.id,
      userName ?? this.userName,
      registerTime ?? this.registerTime,
      firstDeposit ?? this.firstDeposit,
      bonus ?? this.bonus,
      status ?? this.status,
      statusTxt ?? this.statusTxt,
      statusColor ?? this.statusColor,
    );
  }
}
