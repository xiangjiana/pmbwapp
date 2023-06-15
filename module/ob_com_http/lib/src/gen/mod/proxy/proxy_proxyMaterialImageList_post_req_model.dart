import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMaterialImageListPostReqModel {
  ProxyProxyMaterialImageListPostReqModel({
    required this.beginDate,
    required this.beginUpdateDate,
    required this.createdBy,
    required this.endDate,
    required this.endUpdateDate,
    required this.imageName,
    required this.imageSize,
    required this.imageType,
    required this.orderKey,
    required this.orderType,
    required this.pageNum,
    required this.pageSize,
    required this.updatedBy,
  });

  factory ProxyProxyMaterialImageListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyMaterialImageListPostReqModel(
        beginDate: jsonRes['beginDate'] == null
            ? ''
            : asT<String>("beginDate", jsonRes['beginDate'])!,
        beginUpdateDate: jsonRes['beginUpdateDate'] == null
            ? ''
            : asT<String>("beginUpdateDate", jsonRes['beginUpdateDate'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        endDate: jsonRes['endDate'] == null
            ? ''
            : asT<String>("endDate", jsonRes['endDate'])!,
        endUpdateDate: jsonRes['endUpdateDate'] == null
            ? ''
            : asT<String>("endUpdateDate", jsonRes['endUpdateDate'])!,
        imageName: jsonRes['imageName'] == null
            ? ''
            : asT<String>("imageName", jsonRes['imageName'])!,
        imageSize: jsonRes['imageSize'] == null
            ? ''
            : asT<String>("imageSize", jsonRes['imageSize'])!,
        imageType: jsonRes['imageType'] == null
            ? 0
            : asT<int>("imageType", jsonRes['imageType'])!,
        orderKey: jsonRes['orderKey'] == null
            ? 0
            : asT<int>("orderKey", jsonRes['orderKey'])!,
        orderType: jsonRes['orderType'] == null
            ? ''
            : asT<String>("orderType", jsonRes['orderType'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String beginDate = '';
  String beginUpdateDate = '';
  String createdBy = '';
  String endDate = '';
  String endUpdateDate = '';
  String imageName = '';
  String imageSize = '';
  int imageType = 0;
  int orderKey = 0;
  String orderType = '';
  int pageNum = 0;
  int pageSize = 0;
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'beginDate': beginDate,
        'beginUpdateDate': beginUpdateDate,
        'createdBy': createdBy,
        'endDate': endDate,
        'endUpdateDate': endUpdateDate,
        'imageName': imageName,
        'imageSize': imageSize,
        'imageType': imageType,
        'orderKey': orderKey,
        'orderType': orderType,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'updatedBy': updatedBy,
      };
}
