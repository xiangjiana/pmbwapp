import 'domains_provider.dart';

class MemoryCacheDomainProvider extends DomainsProvider {
  final cachedDomains;

  MemoryCacheDomainProvider(this.cachedDomains);

  @override
  Future<List<String>> queryDomains() async {
    return cachedDomains;
  }
}
