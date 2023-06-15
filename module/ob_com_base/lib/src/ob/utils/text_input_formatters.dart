import 'package:flutter/services.dart';
import 'package:ob_com_base/src/ob/utils/format_util.dart';
import 'package:ob_component/ob_component.dart';

abstract class OBRealNameFormatter {
  static FilteringTextInputFormatter realName = FilteringTextInputFormatter.allow(RegExp(
    r'[\u4e00-\u9fa5a-zA-Z\u0E00-\u0E7F\s ·.aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ]',
  ));
}

class TextInputFormatters {
  //只能输入两位小数的数字
  static final TextInputFormatter digit2 =
      TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    return RegExp(r'^\d+(\.\d{0,2})?$').hasMatch(newValue.text)
        ? newValue
        : oldValue;
  });
}

// TextNumberLimitFormatter
class TextNumberLimitFormatter extends TextInputFormatter {
  num maxNumberLimit;
  final bool format;
  final bool selectionOffsetToLast;

  TextNumberLimitFormatter(this.maxNumberLimit, {this.format = false, this.selectionOffsetToLast = false});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    if (num.parse(newValue.text.replaceAll(',', '')) > maxNumberLimit) {
      final limit = maxNumberLimit.floor().toString();
      final formatLimit = numberFormat(maxNumberLimit.fixed(2),point: 2);
      final length = format ? formatLimit.length : limit.length;
      TextEditingValue maxValue = newValue.copyWith(
        text: format ? formatLimit : limit,
        selection: TextSelection.collapsed(offset: selectionOffsetToLast ? length : -1),
      );
      return maxValue;
    }
    return newValue;
  }
}


// 小数限制
class PrecisionLimitFormatter extends TextInputFormatter{
  int _scale;

  PrecisionLimitFormatter(this._scale);

  RegExp exp = new RegExp("[0-9.]");
  RegExp space = new RegExp("[\u0020|\u3000]");
  static const String POINTER = ".";
  static const String DOUBLE_ZERO = "00";

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(POINTER) && newValue.text.length == 1) {
      //第一个不能输入小数点
      return oldValue;
    }

    ///输入完全删除
    if (newValue.text.isEmpty) {
      return newValue;
    }

    ///不允许输入小数
    if (_scale == 0 && newValue.text.contains(POINTER)) {
      return oldValue;
    }

    ///不允许输入空格
    if(space.hasMatch(newValue.text)){
      return oldValue;
    }

    ///只允许输入小数
    if (!exp.hasMatch(newValue.text.replaceAll(',', ''))) {
      return oldValue;
    }

    ///包含小数点的情况
    if (newValue.text.contains(POINTER)) {
      ///包含多个小数
      if (newValue.text.indexOf(POINTER) != newValue.text.lastIndexOf(POINTER)) {
        return oldValue;
      }
      String input = newValue.text;
      int index = input.indexOf(POINTER);

      ///小数点后位数
      int lengthAfterPointer = input.substring(index, input.length).length - 1;

      ///小数位大于精度
      if (lengthAfterPointer > _scale) {
        return oldValue;
      }
    } else if (newValue.text.startsWith(POINTER)) {
      ///不包含小数点,不能以“00”开头
      return oldValue;
    }
    return newValue;
  }
}