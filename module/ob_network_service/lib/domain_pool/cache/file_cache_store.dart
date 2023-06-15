import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'cache_store.dart';
import 'package:stash/stash_api.dart' hide CacheStore;
import 'package:stash_file/stash_file.dart';

class FileCacheStore implements CacheStore {
  final String _cacheName;
  final String _path;
  late final _cache = newLocalDiskCache(
      cacheName: _cacheName,
      path: _path,
      maxEntries: 15,
      expiryPolicy: const AccessedExpiryPolicy(Duration(days: 90)),
      evictionPolicy: const LruEvictionPolicy(),
      fromEncodable: (json) => json);

  FileCacheStore(this._cacheName, this._path);

  @override
  Future<List<String>> get() async {
    final keys = await _cache.keys;
    return Future.wait(keys.map((e) => _cache.get(e) as Future<String>));
  }

  @override
  Future<void> put(String url) async {
    await _cache.put(md5.convert(utf8.encode(url)).toString(), url);
  }
}
