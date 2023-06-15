import 'dart:convert';

import 'package:sp_util/sp_util.dart';

/// 根据用户名的缓存，用户切换后取到正确的数据
class CacheUtil {
  static get username => SpUtil.getString("userName");

  static save(String key, dynamic value) {
    SpUtil.putString(
      'c_${username}_$key',
      jsonEncode(value),
    );
  }

  static get(String key) {
    return jsonDecode(SpUtil.getString(
      'c_${username}_$key',
      defValue: "{}",
    ) ?? '');
  }

  static saveAll(String key, dynamic value) {
    SpUtil.putString(
      'ob_$key',
      jsonEncode(value),
    );
  }

  static getAll(String key) {
    return jsonDecode(SpUtil.getString(
      'ob_$key',
      defValue: "{}",
    ) ?? "{}");
  }

  static saveStringList(String key, List<String> value) {
    return SpUtil.putStringList('c_${username}_$key', value);
  }

  static List<String> getStringList(String key) {
    try {
      return SpUtil.getStringList('c_${username}_$key') ?? <String>[];
    } catch(e) {
      return <String>[];
    }
  }

  static haveKey(String key) {
    return SpUtil.haveKey('c_${username}_$key');
  }

  static remove(String key) {
    SpUtil.remove('c_${username}_$key');
  }

  static clear() {
    List<String>? keys = SpUtil.getKeys()?.toList();
    if (keys?.isNotEmpty ?? false) {
      for (int i = 0; i < keys!.length; i++) {
        if (keys[i].contains('c_${username}_')) SpUtil.remove(keys[i]);
      }
    }
  }
}
