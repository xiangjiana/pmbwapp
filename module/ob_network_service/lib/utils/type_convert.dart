
import 'package:flutter/foundation.dart';

T? asTFix<T>(String key, dynamic value, CustomTrace trace) {
  try {
    if (T == double && value.runtimeType == int) {
      value = double.tryParse('${value.toString()}') ?? 0.0;
    }
    if (T == String && value.runtimeType == int) {
      value = value.toString();
    }
    if (T == int && value.runtimeType == double) {
      value = int.tryParse('$value') ?? (value * 1).round();
    }
    if (T == bool && value is Map) {
      value = true;
    }
    if (!(value is T)) {
      print(
          '--------key:【$key】,value 【$value】 is not $T in file 【${trace.fileName}】, line :【${trace.lineNumber}】');
      if (T == int) {
        return (int.tryParse('$value') ?? (value * 1).round()) as T;
      }
      if (T == String) {
        return '$value' as T;
      }
      if (T == double) {
        return (double.tryParse('$value') ?? 0.0) as T;
      }
    }
    return value;
  } on Error catch (e) {
    print('数据转换类型错误:${e.toString()}');
    return value;
  }
}

//https://www.thetopsites.net/article/51593407.shtml
class CustomTrace {
  final StackTrace _trace;

  String fileName = '';
  int lineNumber = 0;
  int columnNumber = 0;

  CustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    if (kIsWeb) return;

    var traceString = this._trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_/]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    if (listOfInfos.length >= 1) this.fileName = listOfInfos[0];
    if (listOfInfos.length >= 2)
      this.lineNumber = int.tryParse(listOfInfos[1]) ?? 0;
    if (listOfInfos.length >= 3) {
      var columnStr = listOfInfos[2];
      columnStr = columnStr.replaceFirst(")", "");
      this.columnNumber = int.tryParse(columnStr) ?? 0;
    }
  }
}
