import '../provider/domains_provider.dart';

abstract class DomainProcessor {
  Future<String> process(List<DomainsProvider> providers);
}
