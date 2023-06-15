import 'domains_provider.dart';

class GithubRawFileDomainProvider implements DomainsProvider {
  GithubRawFileDomainProvider(this.fileUrl);

  final String fileUrl;

  @override
  Future<List<String>> queryDomains() {
    // TODO: implement queryDomains
    throw UnimplementedError();
  }
}
