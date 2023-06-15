import 'dart:io';

import 'package:repository/utils/domainService.dart';

import './exception/no_valid_domain_exception.dart';
import './processor/domain_processor.dart';
import './provider/domains_provider.dart';
import './provider/memory_cache_domain_provider.dart';
import 'package:neat_periodic_task/neat_periodic_task.dart';

typedef DomainChangeListener = void Function(
    String oldDomain, String newDomain);

/// 默认内置域名
final List<String> _buildInDomains = List.unmodifiable([]);

/// 域名池
class DomainPool {
  final List<DomainsProvider> regularProvider;
  final List<DomainsProvider> emergencyProvider;

  /// 域名过期时间检测 每隔一个小时进行一次检测 否则返回当前缓存域名
  final Duration expireDuration;

  final DomainProcessor domainProcessor;

  DomainChangeListener? listener;

  /// 默认域名
  String _domain;

  set domain(String value) {
    if (_domain != value) {
      listener?.call(_domain, value);
      _domain = value;
    }
  }

  String get domain => _domain;

  /// 最近一次检测时间
  DateTime? lastFetchTime;

  late final NeatPeriodicTaskScheduler _scheduler;

  DomainPool({
    required this.regularProvider,
    required this.domainProcessor,
    this.expireDuration = const Duration(hours: 1),
    String? domain,
    List<DomainsProvider>? emergencyProvider,
    this.listener,
  })  : _domain = domain ?? _buildInDomains.first,
        emergencyProvider = emergencyProvider ?? [] {
    _scheduler = NeatPeriodicTaskScheduler(
      interval: expireDuration,
      name: 'domain_pool_task',
      timeout: Duration(seconds: 5),
      minCycle: Duration(seconds: 1),
      task: () async => fetchLatestDomain(),
    );
  }

  Future<void> startSchedule() async {
    _scheduler.start();
    await ProcessSignal.sigterm.watch().first;
  }

  Future<void> stopSchedule() async {
    await _scheduler.stop();
  }

  void setListener(DomainChangeListener listener) {
    this.listener = listener;
  }

  Future<String> fetchLatestDomain() {
    if (lastFetchTime != null &&
        DateTime.now().difference(lastFetchTime!).compareTo(expireDuration) <
            0) {
      return Future.value(domain);
    }

    return forceFetchDomain();
  }

  Future<String> forceFetchDomain() {
    return domainProcessor
        .process(regularProvider
          ..add(MemoryCacheDomainProvider([..._buildInDomains, domain])))
        .catchError((e) {
      return domainProcessor.process(emergencyProvider).catchError(
          (e) => _buildInDomains.first,
          test: (e) => e is NoValidDomainException);
    }, test: (e) => e is NoValidDomainException).then((value) async {
      domain = value;
      lastFetchTime = DateTime.now();
      return value;
    });
  }
}
