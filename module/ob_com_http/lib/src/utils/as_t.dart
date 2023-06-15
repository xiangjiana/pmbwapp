import 'package:repository/utils/type_convert.dart';

T? asT<T>(String key, dynamic value) {
  // if (value is T) {
  //   return value;
  // }
  return asTFix(key, value, CustomTrace(StackTrace.current));
}