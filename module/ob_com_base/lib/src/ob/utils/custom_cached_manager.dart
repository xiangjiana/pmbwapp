import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart';

class CustomCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'obCachedImageData';

  static late final CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._()
      : super(Config(
          key,
          fileService: HttpFileService(),
        ));
}

class HttpFileService extends FileService {
  late HttpClient _httpClient;

  HttpFileService({HttpClient? httpClient}) {
    _httpClient = httpClient ?? HttpClient();
    _httpClient.badCertificateCallback = (cert, host, port) => true;
  }

  @override
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers = const {}}) async {
    final Uri resolved = Uri.base.resolve(url);
    final HttpClientRequest req = await _httpClient.getUrl(resolved);
    headers?.forEach((key, value) {
      req.headers.add(key, value);
    });
    final HttpClientResponse httpResponse = await req.close();
    final StreamedResponse _response = StreamedResponse(
      httpResponse.timeout(Duration(seconds: 60)),
      httpResponse.statusCode,
      contentLength: httpResponse.contentLength,
      reasonPhrase: httpResponse.reasonPhrase,
      isRedirect: httpResponse.isRedirect,
    );
    return HttpGetResponse(_response);
  }
}
