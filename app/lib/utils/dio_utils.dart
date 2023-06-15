import 'package:dio/dio.dart';
import 'package:exception/exception.dart';

void onDioError(
  DioError dioError,
  Function(int code, String msg) onServerException,
) {
  if (dioError.error is ServerException) {
    var serverException = dioError.error as ServerException;
    onServerException(serverException.code, serverException.message);
  }
}
