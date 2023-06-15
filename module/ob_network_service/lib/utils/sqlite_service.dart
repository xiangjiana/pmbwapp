import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class NetCache {
  static late Database db;
  static String tableName = 'ob_dataBase';
  static String userid = '0';

  static Future<bool?> sqliteConnection() async {
    db = await openDatabase('ob_cache.db');
    return db.isOpen;
  }

  //是否开启db库
  static bool dbIsOpen() {
    return db.isOpen;
  }

  static Future<bool> tableisEmpty() async {
    var sql =
        "select count(*) as count from sqlite_master where type ='table' and name ='$tableName';";
    List<Map<String, Object?>>? cursor = await db.rawQuery(sql, null);
    if (cursor == null || cursor.isEmpty) {
      return false;
    }
    if (cursor[0]['count'] == null || cursor[0]['count'] == 0) {
      return false;
    }
    return true;
  }

  static void createTable() async {
    try {
      await db.execute(
          'CREATE TABLE $tableName (id VARCHAR(32) PRIMARY KEY,userid INTEGER,keys VARCHAR(500),soure TEXT,cache_time INTEGER,exp_time INTEGER,size INTEGER);');
      // ignore: nullable_type_in_catch_clause
    } on DatabaseException catch (e) {
      debugPrint('创建表失败${e.getResultCode()}');
    } catch (e) {
      debugPrint('创建缓存异常:$e');
    }
  }

  static void deleteTable() async {
    try {
      await db.execute('DROP TABLE $tableName');
    } on DatabaseException catch (e) {
      debugPrint(e.getResultCode().toString());
    } catch (e) {
      debugPrint('删除缓存异常:$e');
    }
  }

//插入或更新
  static void inserAndUpdateData(String key, String data, int time) {
    try {
      deleteCache(); //缓存
      var id = generateMD5(userid.toString() + key);
      // ignore: unused_local_variable
      var cacheTime = DateTime.now().millisecondsSinceEpoch + (time * 1000); //
      db.transaction((txn) async {
        var batch = txn.batch();
        int dd = await txn.rawInsert(
            'replace into $tableName (id,userid,keys,soure,cache_time,exp_time,size) values (?,?,?,?,?,?,?)',
            [id, userid, key, data, cacheTime, -1, data.length]);
        debugPrint(dd.toString());
        await batch.commit(noResult: true, continueOnError: true);
      });
    } on DatabaseException catch (e) {
      debugPrint('插入或者更新缓存失败====$e');
    } catch (e) {
      debugPrint('缓存更新异常:$e');
    }
  }

  //查询全部
  static Future<List<Map<String, dynamic>>> selectTableAll() async {
    return await db.rawQuery('SELECT * FROM $tableName');
  }

  //所有缓存条数
  static Future<int?> cacheCountAll() async {
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  //根据用户查询缓存条目
  static Future<int?> cacheCountUser(String userid) async {
    return Sqflite.firstIntValue(await db
        .rawQuery('SELECT COUNT(*) FROM $tableName where userid=?', [userid]));
  }

  //所有缓存大小
  static Future<int?> cacheSizeAll() async {
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT SUM(size) FROM $tableName'));
  }

  //根据用户查询缓存大小
  static Future<int?> cacheSizeUser(String userid) async {
    return Sqflite.firstIntValue(await db
        .rawQuery('SELECT SUM(size) FROM $tableName where userid=?', [userid]));
  }

  static void deleteCache() async {
    List<Map<String, dynamic>> list;
    try {
      //先查询出来多少个用户 按照最后最长时间没有更新缓存的用户删除
      list = await db.rawQuery(
          'SELECT * FROM $tableName  group by userid order by cache_time');
      if (list.length > 5) {
        await cacheDeleteUser(list[0]['userid'].toString());
      }
    } on DatabaseException catch (e) {
      debugPrint('删除缓存失败====$e');
      return null;
    } catch (e) {
      debugPrint('缓存删除异常 :$e');
      return null;
    }
    if (list == null || list.isEmpty) {
      return null;
    }
    // return Sqflite.firstIntValue(await db.rawQuery('SELECT * FROM $tableName  group by userid order by exp_time'));
  }

  //清空缓存
  static Future<int?> cacheDeleteAll() async {
    return Sqflite.firstIntValue(await db.rawQuery('DELETE FROM $tableName'));
  }

  //根据用户清空缓存
  static Future<int?> cacheDeleteUser(String userid) async {
    return Sqflite.firstIntValue(
        await db.rawQuery('DELETE FROM $tableName where userid=?', [userid]));
  }

  /// 查询缓存
  /// key: uri地址
  /// userId: 用户id
  static Future<Map<String, dynamic>?> selectCache(String key,
      {String? userId}) async {
    List<Map<String, dynamic>> list;
    String id;
    id = userId ?? userid;
    try {
      list = await db.rawQuery(
          'SELECT * FROM $tableName where userid=? and keys=?', [id, key]);
    } on DatabaseException catch (e) {
      debugPrint('插查询缓存失败====$e');
      return null;
    } catch (e) {
      debugPrint('查询缓存异常:$e');
      return null;
    }
    if (list == null || list.isEmpty) {
      return null;
    }
    return list[0];
  }

  static String generateMD5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}
