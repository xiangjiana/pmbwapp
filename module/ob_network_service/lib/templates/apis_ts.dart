class ApisTs {
  static String apis_ts = '''
      import \'../../utils/net.dart\'; 
      import \'package:dio/dio.dart\'; 
      <#MoreImps> 
      class <#GroupName>Apis { <#Apis> } ''';
  static String import_ts = 'import \'../adaptor/<#>.dart\';';
  static String api_ts = '''
  static void <#ApiNameLower>(
    {
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) { 
    if (parameters != null && parameters is <#ApiName>ReqModel) {
      parameters = parameters.toJson();
    }

    Net().<#Method>(
      \'<#Uri>\',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        <#ApiName>RespAdaptor.onSuccess(r.data, success,r.statusCode,r.headers.value('exp')==null?0:int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        <#ApiName>RespAdaptor.onFail(code, msg, fail);
      },
    );
  }
  ''';
}

// class UserApis {}
