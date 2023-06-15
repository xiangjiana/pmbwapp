import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

typedef CheckFunction = bool Function();

final FormFieldValidator<String?> verifyCodeValidator = (String? value) {
  final length = (value?.length ?? 0);
  if (length < 6 || length > 8) {
    return '';
  }
  return null;
};

RegExp regExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$');
final FormFieldValidator<String?> passwordValidator = (String? value) {
  final length = (value?.length ?? 0);
  if (length < 8 || length > 12) {
    return 'user_enter_a_password_of812_digits'.tr;
  }
  bool password = regExp.hasMatch(value!);
  if (!password) {
    return 'password_does_not_meet_the_rules'.tr;
  }
  return null;
};

final FormFieldValidator<String?> noEmptyValidator = (String? value) {
  final length = (value?.length ?? 0);
  return length > 0 ? null : '';
};

final FormFieldValidator<String?> noEmptyValidator2 = (String? value) {
  final length = (value?.length ?? 0);
  return (length >= 1 && length <= 64) ? null : '';
};

final FormFieldValidator<String?> Function(num start, num end) closedRangeValidator = (min, max) {
  return (String? value) {
    if (value == null) return '';
    if (min > max) return '';
    var digit = num.tryParse(value.replaceAll(',', '')) ?? -1;
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      digit = digit * 1000;
    }
    return (digit >= min && digit <= max) ? null : '';
  };
};

final FormFieldValidator<String?> Function(num start, num end)
    openClosedRangeValidator = (min, max) {
  return (String? value) {
    if (value == null) return '';
    if (min > max) return '';
    var digit = num.tryParse(value.replaceAll(',', '')) ?? -1;
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      //digit = digit * 1000;
    }
    return (digit > 0 && digit >= min && digit <= max) ? null : '';
  };
};

final FormFieldValidator<String?> Function(String tip, {CheckFunction? callback}) stringValidator = (tip , {CheckFunction? callback}) {
  return (String? value) {
    if (callback != null && callback() == false) return null;
    final length = (value?.length ?? 0);
    return length > 0 ? null : tip;
  };
};

final FormFieldValidator<String?> Function(String tip, num min, {CheckFunction? callback}) minValidator =
    (tip, min, {CheckFunction? callback}) {
  return (String? value) {
    if (callback != null && callback() == false) return null;
    final length = (value?.length ?? 0);
    if (length == 0) return tip;
    double num = double.tryParse(value!) ?? 0.0;
    return num < min ? 'lower_than_the_minimum_withdrawal_amount'.tr : null;
  };
};

final FormFieldValidator<String?> emailValidator = (String? value) {
  final length = (value?.length ?? 0);
  if (length > 0) {
    // 邮箱正则
    String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    RegExp input = RegExp(regexEmail);
    if (!input.hasMatch(value!)) {
      return 'email_address_does_not_conform'.tr;
    }
    return null;
  }
  return null;
};

final FormFieldValidator<String?> codeValidator = (String? value) {
  final length = (value?.length ?? 0);
  if(length > 0 && length < 6){
    return 'verification_code_does_not_meet_the_rules'.tr;
  }
  return null;
};

