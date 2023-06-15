///
extension NumExtension on num {
  /// 小数点截取 [fractionDigits] 位
  String fixed(int fractionDigits) {
    final String fixString = toStringAsFixed(fractionDigits + 1);
    return fixString.substring(0, fixString.length - 1);
  }
}
