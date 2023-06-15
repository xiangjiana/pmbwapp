import 'package:intl/intl.dart';
import 'package:ob_component/ob_component.dart' show NumExtension;

/// 千分位加逗号，直接截取，而不是四舍五入
String numberFormat(dynamic data, {point: 2, comma = true}) {
  try {
    if (double.tryParse(data.toString()) == null) return '--';
    if (data == double.infinity) return '0.00';
    if (data == double.negativeInfinity) return '0.00';
    final dataStr = data.toString();
    String integer;
    String decimal;
    if (dataStr.contains('.')) {
      final List<String> splitArr = dataStr.split('.');
      integer = splitArr[0];
      decimal = splitArr[1].length > 1
          ? splitArr[1].substring(0, point)
          : splitArr[1] + '0' * (point - 1);
    } else {
      integer = dataStr;
      decimal = '0' * point;
    }

    bool negative = integer.contains('-0');
    String format = comma ? '###,###,###' : '';
    integer = NumberFormat(format).format(int.parse(integer));
    if (negative && (integer.contains('-')) == false) {
      integer = '-' + integer;
    }
    return point == 0 ? integer : integer + '.' + decimal;
  } catch (_) {
    return '0.00';
  }
}

String contentTextFormat(dynamic content, {point: 2, comma = true}) {
  if (content == null) return '';
  if (content is double) {
    if (content.abs() > 100000000.0) {
      return numberFormat(content / 1000, point: 0) + "k";
    }
    return numberFormat(content,point: point);
  }
  return '$content';
}

String getDepositUsdtAmountByRate(num amount, num rate) {
  try {
    final expectPayedUsdt = (amount / rate).fixed(3);
    final strArr = expectPayedUsdt.toString().split('.');
    final intArr = strArr[0];
    final decimalArr = strArr[1].split('');
    int first = int.parse(decimalArr[0]);
    int second = int.parse(decimalArr[1]);
    int third = int.parse(decimalArr[2]);
    if (third > 0) {
      ++second;
      first = second > 9 ? ++first : first;
      second = second > 9 ? 0 : second;
      return intArr + '.' + '$first' + '$second';
    } else {
      return intArr + '.' + '$first' + '$second';
    }
  } catch (_) {
    return (amount / rate).fixed(2);
  }
}

String getDurationByMs(int ms) {
  try {
    final Duration d = Duration(milliseconds: ms);
    final List<String> list = d.toString().split(':');
    final String h = int.parse(list[0]) < 10 ? '0' + list[0] : list[0];
    final String m = list[1];
    final String s = list[2].substring(0, 2);
    return '$h:$m:$s';
  } catch (_) {
    return '00:00:00';
  }
}

String realNameFormat(String realName) {
  realName = realName.replaceAll("-", '');
  if (realName.length <= 0) return '';
  int markNum = realName.length > 25 ? 25 : realName.length - 1;
  return realName.replaceRange(
      0, realName.length - 1, "*" * markNum);
}
