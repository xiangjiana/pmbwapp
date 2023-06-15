import 'package:dio/dio.dart';
import 'package:exception/exception.dart';

class EnvelopeInterceptor extends Interceptor {
  final bool openEncrypt;

  EnvelopeInterceptor(this.openEncrypt);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (openEncrypt) {
      super.onRequest(options, handler);
      return;
    }
    if (options.responseType == ResponseType.plain) {
      options.responseType = ResponseType.json;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.extra.containsKey('skip')) {
      handler.next(response);
      return;
    }
    final data = response.data;
    if (data is Map<String, dynamic> && _isServerResponse(data)) {
      final code = data['code'];
      final message = data['msg'];
      if (code == 200) {
        response.data = data['data'];
        handler.next(response);
      } else {
        final error = DioError(
          type: DioErrorType.unknown,
          error: ServerException(code, message),
          requestOptions: response.requestOptions,
        );
        handler.reject(error, true);
      }
    } else {
      handler.next(response);
    }
  }

  bool _isServerResponse(Map<String, dynamic> data) {
    return data['msg'] != null && data['code'] != null;
  }
}
