import 'package:flutter/services.dart';

class MaskMoneyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;

      final RegExpMatch? isDigitMatch = RegExp(r'^(-?)(\d*)(\.(\d+))?$')
          .firstMatch(newValue.text.replaceAll(',', ''));

      if (isDigitMatch == null) {
        return newValue;
      }
      final String? negative = isDigitMatch.group(1);
      final String? int = ((isDigitMatch.group(2)?.isEmpty ?? true)
              ? '0'
              : isDigitMatch.group(2))
          ?.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      String? decimal = isDigitMatch.group(4) ?? '';
      String newString =
          '$negative$int${decimal.isEmpty ? decimal : '.$decimal'}';
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
