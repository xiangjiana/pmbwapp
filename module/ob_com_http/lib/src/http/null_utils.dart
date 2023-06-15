class NullUtils {
  NullUtils._();

  static num toNum(String? str) {
    return num.tryParse(str ?? "") ?? 0;
  }

  static double toDouble(String? str) {
    return double.tryParse(str ?? "") ?? 0.00;
  }

  static int toInt(String? str) {
    return int.tryParse(str ?? "") ?? 0;
  }

  static bool toBool(String? str) {
    try {
      return (str ?? "").toLowerCase() == 'true';
    } catch (e) {
      return false;
    }
  }

  static String orEmpty(String? value) {
    return value ?? '';
  }

  static bool orFalse(bool? value) {
    return value ?? false;
  }

  static int or0(int? value) {
    return value ?? 0;
  }

  static double or00(double? value) {
    return value ?? 0.00;
  }
}
