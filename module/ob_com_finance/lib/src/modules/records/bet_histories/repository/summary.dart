class Summary {
  double betAmountTotal;
  double validBetAmountTotal;
  int countTotal;
  double netAmountTotal;

  Summary(this.betAmountTotal, this.validBetAmountTotal, this.countTotal,
      this.netAmountTotal);

  @override
  String toString() {
    return 'Summary{betAmountTotal: $betAmountTotal,validBetAmountTotal$validBetAmountTotal, countTotal: $countTotal, netAmountTotal: $netAmountTotal}';
  }
}
