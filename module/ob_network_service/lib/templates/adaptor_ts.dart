class AdaptorTs {
  static String importTs = '''
  import 'dart:convert';
  import '../gen/mod/<#FileName>_model.dart';


class <#ClassName>Adaptor {
  static void onSuccess(json, success,code,exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
     <#ClassName>Model model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
       if (data['data'].isEmpty) {
        model = <#ClassName>Model.fromJson({"data": {}});
      } else {
        model = <#ClassName>Model.fromJson(data['data']);
      }
    } else {
      model = <#ClassName>Model.fromJson({"data": data['data']});
    }

    if (success != null) {
      if(success is Function(<#ClassName>Model data)){
      success(model);

      }else{
      success(model,code,exp);

      }

    }
  }

  static void onFail(code, msg, fail) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    if (fail != null) {
      fail(code, msg);
    }
  }
}
''';
}
