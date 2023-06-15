import 'package:dio/dio.dart';

abstract class HeaderUtils {
  static const domain = 'domain';
  static const domainTag = 'domainTag';
  static const domainType = 'domainType';
  static const isRetry = 'isRetry';
  static const isNoDomain = 'isNoDomain';

  static String getDomain(RequestOptions options) {
    return options.headers[domain];
  }

  static String getDomainTag(RequestOptions options) {
    return options.headers[domainTag];
  }

  static int getDomainType(RequestOptions options) {
    return options.headers[domainType];
  }

  static bool getIsRetry(RequestOptions options) {
    return options.headers[isRetry] ?? false;
  }

  static bool getIsNoDomain(RequestOptions options) {
    return options.headers[isNoDomain] ?? false;
  }
}
