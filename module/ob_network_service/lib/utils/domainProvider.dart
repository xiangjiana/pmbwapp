import 'package:repository/domain_pool/provider/domains_provider.dart';

class DomainProvider implements DomainsProvider {
  List<String> domainList;
  DomainProvider(this.domainList);
  @override
  Future<List<String>> queryDomains() async {
    return domainList;

    //   [
    //   'https://www.7.jo/',
    //   'https://www.2.woi/',
    //   'https://www.sina.com/',
    //   'https://www.163.com/',
    // ];
  }
}
