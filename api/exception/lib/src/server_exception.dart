import 'package:exception/src/app_exception.dart';

class ServerException implements AppException {
  final int code;
  final String message;

  ServerException(this.code, this.message);
}
