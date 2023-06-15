import 'dart:convert';

// import 'package:dart_style/dart_style.dart';
import 'config.dart';
import '../utils/dart_helper.dart';
import '../utils/my_string_buffer.dart';

import 'dart_object.dart';

class JsonToDartController {
  //格式化json
  String formatJson(String className, String content) {
    DartObject? dartObject;
    content = content.replaceAll('"list":', '"listElement":');
    final dynamic jsonData = jsonDecode(content);
    late final Map<String, dynamic> jsonObject;
    late final DartObject extendedObject;
    if (jsonData is Map) {
      jsonObject = jsonData as Map<String, dynamic>;
      extendedObject = DartObject(
        depth: 0,
        keyValuePair: MapEntry<String, dynamic>(className, jsonObject),
        nullable: false,
        uid: className,
      );
    } else if (jsonData is List) {
      jsonObject = jsonData.first as Map<String, dynamic>;

      final Map<String, List<dynamic>> root = <String, List<dynamic>>{
        className: jsonData
      };
      extendedObject = DartObject(
        depth: 0,
        keyValuePair: MapEntry<String, dynamic>(className, root),
        nullable: false,
        uid: className,
      ).objectKeys[className]!
        ..decDepth();
    }
    dartObject = extendedObject;
    //////////////////////////////////
    final MyStringBuffer sb = MyStringBuffer();
    sb.writeLine(DartHelper.jsonImport);
    if (ConfigSetting().addMethod) {
      if (ConfigSetting().enableArrayProtection) {
        sb.writeLine('import \'dart:developer\';');
        sb.writeLine(ConfigSetting().nullsafety
            ? DartHelper.tryCatchMethodNullSafety
            : DartHelper.tryCatchMethod);
      }
      sb.writeLine(ConfigSetting().enableDataProtection
          ? ConfigSetting().nullsafety
              ? DartHelper.asTMethodWithDataProtectionNullSafety
              : DartHelper.asTMethodWithDataProtection
          : ConfigSetting().nullsafety
              ? DartHelper.asTMethodNullSafety
              : DartHelper.asTMethod);
    }

    sb.writeLine(dartObject.toString());
    return sb.toString();
  }

//生成dart类
  void generateDart(String className, String content) {
    //   printedObjects.clear();
    //   if (dartObject != null) {
    //     final MyStringBuffer sb = MyStringBuffer();
    //     sb.writeLine(DartHelper.jsonImport);
    //     debugPrint("ConfigSetting=${ConfigSetting().addMethod == true}");
    //     if (ConfigSetting().addMethod) {
    //       if (ConfigSetting().enableArrayProtection) {
    //         sb.writeLine('import \'dart:developer\';');
    //         sb.writeLine(ConfigSetting().nullsafety
    //             ? DartHelper.tryCatchMethodNullSafety
    //             : DartHelper.tryCatchMethod);
    //       }
    //       sb.writeLine(ConfigSetting().enableDataProtection
    //           ? ConfigSetting().nullsafety
    //               ? DartHelper.asTMethodWithDataProtectionNullSafety
    //               : DartHelper.asTMethodWithDataProtection
    //           : ConfigSetting().nullsafety
    //               ? DartHelper.asTMethodNullSafety
    //               : DartHelper.asTMethod);
    //     }

    //     sb.writeLine(dartObject!.toString());
    //     String result = sb.toString();
    //     debugPrint("${result}");
    //     // final DartFormatter formatter = DartFormatter();
    //     // result = formatter.format(result);
    //   }
  }
}
