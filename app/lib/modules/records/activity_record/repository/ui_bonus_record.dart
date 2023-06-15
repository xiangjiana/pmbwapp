import 'dart:ui';

class UiBonusRecord {
  final String id;
  final String userName;
  final bool isTimeType;
  final String registerTime;
  final String firstDepositTime;
  final String endTime;
  final String forecastBonus;
  final String validBet;
  final String totalBonus;
  final String totalPayment;
  final int status;
  final String statusTxt;
  final Color statusColor;
  final int betCountType;

  UiBonusRecord(
    this.id,
    this.userName,
    this.isTimeType,
    this.registerTime,
    this.firstDepositTime,
    this.endTime,
    this.forecastBonus,
    this.validBet,
    this.totalBonus,
    this.totalPayment,
    this.status,
    this.statusTxt,
    this.statusColor,
    this.betCountType,
  );

  UiBonusRecord copyWith(
      {String? id,
      String? userName,
      bool? isTimeType,
      String? registerTime,
      String? firstDepositTime,
      String? endTime,
      String? forecastBonus,
      String? validBet,
      String? totalBonus,
      String? totalPayment,
      int? status,
      String? statusTxt,
      Color? statusColor,
      int? betCountType}) {
    return UiBonusRecord(
      id ?? this.id,
      userName ?? this.userName,
      isTimeType ?? this.isTimeType,
      registerTime ?? this.registerTime,
      firstDepositTime ?? this.firstDepositTime,
      endTime ?? this.endTime,
      forecastBonus ?? this.forecastBonus,
      validBet ?? this.validBet,
      totalBonus ?? this.totalBonus,
      totalPayment ?? this.totalPayment,
      status ?? this.status,
      statusTxt ?? this.statusTxt,
      statusColor ?? this.statusColor,
      betCountType ?? this.betCountType,
    );
  }
}
