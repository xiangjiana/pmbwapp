import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

class Bonus {
  Bonus({
    required this.billAmount,
    required this.bonusAmount,
    required this.bonusStatus,
    required this.bonusType,
    required this.businessId,
    required this.createdAt,
    required this.id,
    required this.merchantId,
    required this.remark,
    required this.userId,
    required this.receiveTime,
    required this.title,
    required this.content,
    // required this.inviteUserId,
    // required this.inviteUserName,
  });

  factory Bonus.fromJson(Map<String, dynamic> jsonRes) => Bonus(
        billAmount: jsonRes['billAmount'] == null
            ? 0
            : asT<double>("billAmount", jsonRes['billAmount'])!,
        bonusAmount: jsonRes['bonusAmount'] == null
            ? 0
            : asT<double>("bonusAmount", jsonRes['bonusAmount'])!,
        bonusStatus: jsonRes['bonusStatus'] == null
            ? 0
            : asT<int>("bonusStatus", jsonRes['bonusStatus'])!,
        bonusType: jsonRes['bonusType'] == null
            ? 0
            : asT<int>("bonusType", jsonRes['bonusType'])!,
        businessId: jsonRes['businessId'] == null
            ? ''
            : asT<String>("businessId", jsonRes['businessId'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
        receiveTime: jsonRes['receiveTime'] == null
            ? ''
            : asT<String>("receiveTime", jsonRes['receiveTime'])!,
        title: jsonRes['title'] == null
            ? ''
            : asT<String>("title", jsonRes['title'])!,
        content: jsonRes['content'] == null
            ? ''
            : asT<String>("content", jsonRes['content'])!,
        // inviteUserId: jsonRes['inviteUserId'] == null
        //     ? ''
        //     : asT<String>("inviteUserId", jsonRes['inviteUserId'])!,
        // inviteUserName: jsonRes['inviteUserName'] == null
        //     ? ''
        //     : asT<String>("inviteUserName", jsonRes['inviteUserName'])!,
      );

  double billAmount = 0;
  double bonusAmount = 0;
  int bonusStatus = 0;
  int bonusType = 0;
  String businessId = '';
  String createdAt = '';
  String id = '';
  String merchantId = '';
  String remark = '';
  String userId = '';
  String receiveTime = '';
  String title = '';
  String content = '';
  // String inviteUserId = '';
  // String inviteUserName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'billAmount': billAmount,
        'bonusAmount': bonusAmount,
        'bonusStatus': bonusStatus,
        'bonusType': bonusType,
        'businessId': businessId,
        'createdAt': createdAt,
        'id': id,
        'merchantId': merchantId,
        'remark': remark,
        'userId': userId,
        'receiveTime': receiveTime,
        'title': title,
        'content': content,
        // 'inviteUserId': inviteUserId,
        // 'inviteUserName': inviteUserName,
      };
}
