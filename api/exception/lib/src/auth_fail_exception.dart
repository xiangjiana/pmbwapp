import 'package:exception/src/app_exception.dart';

class AuthFailException extends AppException {
  final int code;
  final String message;

  AuthFailException(this.code, this.message);
}
