import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigAnnouncementPostRespModel {
  ConfigAnnouncementPostRespModel({
    required this.data,
  });

  factory ConfigAnnouncementPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ConfigAnnouncementPostRespModelData>? data = jsonRes['data'] is List ? <ConfigAnnouncementPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ConfigAnnouncementPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ConfigAnnouncementPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ConfigAnnouncementPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ConfigAnnouncementPostRespModelData {
  ConfigAnnouncementPostRespModelData({
    required this.announcementAging,
    required this.announcementContent,
    required this.announcementTitle,
    required this.createdAt,
    required this.createdBy,
    required this.downTime,
    required this.id,
    required this.merchantId,
    required this.status,
    required this.tag,
    required this.terminal,
    required this.upTime,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory ConfigAnnouncementPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ConfigAnnouncementPostRespModelData(
        announcementAging: jsonRes['announcementAging'] == null
            ? 0
            : asT<int>("announcementAging", jsonRes['announcementAging'])!,
        announcementContent: jsonRes['announcementContent'] == null
            ? ''
            : asT<String>(
                "announcementContent", jsonRes['announcementContent'])!,
        announcementTitle: jsonRes['announcementTitle'] == null
            ? ''
            : asT<String>("announcementTitle", jsonRes['announcementTitle'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        downTime: jsonRes['downTime'] == null
            ? ''
            : asT<String>("downTime", jsonRes['downTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        tag: jsonRes['tag'] == null ? 0 : asT<int>("tag", jsonRes['tag'])!,
        terminal: jsonRes['terminal'] == null
            ? ''
            : asT<String>("terminal", jsonRes['terminal'])!,
        upTime: jsonRes['upTime'] == null
            ? ''
            : asT<String>("upTime", jsonRes['upTime'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  int announcementAging = 0;
  String announcementContent = '';
  String announcementTitle = '';
  String createdAt = '';
  String createdBy = '';
  String downTime = '';
  String id = '';
  String merchantId = '';
  int status = 0;
  int tag = 0;
  String terminal = '';
  String upTime = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'announcementAging': announcementAging,
        'announcementContent': announcementContent,
        'announcementTitle': announcementTitle,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'downTime': downTime,
        'id': id,
        'merchantId': merchantId,
        'status': status,
        'tag': tag,
        'terminal': terminal,
        'upTime': upTime,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}
