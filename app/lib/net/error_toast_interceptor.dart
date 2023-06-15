import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exception/exception.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

class ErrorToastInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.extra.containsKey('silent')) {
      return handler.next(err);
    }
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionError:
      case DioErrorType.badCertificate:
        showToast('service_unusual_plz_try_again_later'.tr);
        break;
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 301:
          case 302:
            showToast('service_unusual_plz_try_again_later'.tr);
            break;
          default:
            showToast('service_unusual_plz_try_again_later'.tr);
            break;
        }
        showToast(err.response?.statusMessage ?? '');
        break;
      case DioErrorType.cancel:
        showToast('service_unusual_plz_try_again_later2'.tr);
        break;
      case DioErrorType.unknown:
        switch (err.error.runtimeType) {
          case NetworkException:
          case SocketException:
            showToast('network_unusual_plz_try_again_later'.tr);
            break;
          case ServerException:
            final serviceException = err.error as ServerException;
            switch (serviceException.code) {
              case 301:
              case 302:
                showToast('service_unusual_plz_try_again_later'.tr);
                break;
              default:
                showToast(serviceException.message);
                break;
            }
            break;
        }
        break;
    }
    super.onError(err, handler);
  }
}
