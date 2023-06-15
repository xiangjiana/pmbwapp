import 'package:dio/dio.dart';
import 'package:interceptor/interceptor.dart';
import 'package:interceptor/src/curl_logger_dio_interceptor.dart';
import 'package:interceptor/src/pretty_dio_logger.dart';

void main() async {
  final dio = Dio()
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers.putIfAbsent('token', () => 'token');
      handler.next(options);
    }))
    ..interceptors.add(PrettyDioLogger(responseBody: false))
    ..interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
  try {
    await dio.get('https://www.baidu.com');
  } catch (e) {
    print(e);
  }
}
