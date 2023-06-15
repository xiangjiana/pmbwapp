import 'dart:async';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:repository/utils/net.dart';

final _domainCheckDio = Dio()
  ..options.receiveTimeout = Duration(milliseconds: 200)
  ..options.sendTimeout = Duration(milliseconds: 200)
  ..options.validateStatus = (status) => true;

typedef onCheckFailCallback = void Function(String newDomain);

class QueryDomainTask {
  String? domain;

  dynamic error;

  Completer<void>? current;

  bool get isRunning => current != null && !current!.isCompleted;

  bool get hasError => error != null;

  final onCheckFailCallback? failCallback;

  QueryDomainTask({this.failCallback}) {
    (_domainCheckDio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true;
      };
    };
  }

  void start(List<String> domains, [String path = '']) {
    current = wrapInCompleter(
      findDomain(domains, path).timeout(Duration(seconds: 8)).catchError((e) => error = e),
    );
    current!.future;
  }

  Future<String> checkAndAwait() async {
    Future<String> getRealDomain() {
      if (hasError) throw error;
      return domain != null ? Future.value(domain) : throw NoValidDomainException();
    }

    if (hasError) throw error;
    if (isRunning) {
      await current!.future;
      return getRealDomain();
    } else {
      return getRealDomain();
    }
  }

  Future<void> findDomain(List<String> domains, [String path = '']) async {
    debugPrint('member域名：-检查域名--domains--数量-${domains.length}');
    for (var i = 0; i < domains.length; i++) {
      try {
        var response = await Net().postNew(domains[i] + path);
        debugPrint(
          'member域名：-检查域名--response--${domains[i]}-检查-$path---${response.statusCode}',
        );
        if (response.statusCode == 200 ||
            response.statusCode == 404 ||
            response.statusCode == 20000 ||
            response.statusCode == 4004 ||
            response.statusCode == 400 ||
            response.statusCode == 503) {
          domain = domains[i];
          return;
        } else {
          failCallback?.call(domains[i]);
          continue;
        }
      } catch (e) {
        debugPrint('member域名：-检查域名--超时--数量-${domains[i]}-检查-$path---');
        continue;
      }
    }
    throw NoValidDomainException();
  }
}

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

class NoValidDomainException implements Exception {}
