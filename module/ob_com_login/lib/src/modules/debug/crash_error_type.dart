

enum ErrorExceptionEnum{
  /// dart异常
  RangeError,
  ///页面渲染异常
  FlutterErrorDetails,
  ///服务定义异常
  MissingPluginException,
  ///dio请求异常
  DioError
}

///异常类型与枚举对应
Map<String ,ErrorExceptionEnum> errorMap = {
  'RangeError' : ErrorExceptionEnum.RangeError,
  'FlutterErrorDetails' : ErrorExceptionEnum.FlutterErrorDetails,
  'MissingPluginException' : ErrorExceptionEnum.MissingPluginException,
  'DioError' : ErrorExceptionEnum.DioError,
};

class ErrorParsing{
  static dynamic errorStatus(dynamic error){
    ///判断是否是请求异常
    ///将请求接口地址获取
    if(errorMap[error.runtimeType.toString()] == ErrorExceptionEnum.DioError){
      return {
        '\n msgData' :error?.response?.date??'',
        '\n 请求域名' :error?.request?.baseUrl ??'',
        '\n 请求类型' : error?.request?.method??'',
        '\n 请求地址' : error?.request?.path??'',
        '\n 错误error' : '$error \n'
      };
    }
    return error;
  }
}