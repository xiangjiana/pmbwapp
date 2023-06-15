import '../cache/cache_store.dart';

import 'domains_provider.dart';

class DiskCacheDomainProvider implements DomainsProvider {
  /// 文件缓存路径存储位置
  final CacheStore _store;

  DiskCacheDomainProvider(this._store);

  @override
  Future<List<String>> queryDomains() async {
    return _store.get();
  }
}
