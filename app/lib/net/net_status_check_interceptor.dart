import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:exception/exception.dart';
import 'package:ob_package/utils/connectivity_x.dart';

class NetStatusCheckInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!ConnectivityX.instance.isConnected) {
      final error = DioError(
        requestOptions: options,
        error: NetworkException(),
        type: DioErrorType.unknown,
      );
      handler.reject(error, true);
    } else {
      handler.next(options);
    }
  }
}
