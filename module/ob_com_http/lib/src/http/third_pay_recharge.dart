import 'package:dio/dio.dart';
import 'package:repository/utils/net.dart';

abstract class ThirdPayRecharge {
  static const String url = '/wallet/confirmPay';

  static void post(
    int bizType,
    int clientType,
    String channelId,
    String deviceNo,
    String paidAmount,
    String realName,
    String virtualProtocol, {
    int inGameDeposit = -1,
    required String bankId,
    Function(ApiThirdPayRecharge)? success,
    Function(int, String)? fail,
  }) {
    Net().post(
      url,
      params: {
        'channelId': channelId,
        'deviceNo': deviceNo,
        'realName': realName,
        'paidAmount': double.parse(paidAmount),
        if (inGameDeposit >= 0) 'inGameDeposit': inGameDeposit,
        if (bankId.isNotEmpty) 'bankId': int.parse(bankId),
        if (virtualProtocol.isNotEmpty) 'virtualProtocol': virtualProtocol,
        if (clientType > 0) 'clientType': clientType,
        if (bizType > 0) 'bizType': bizType,
      },
      success: (Response r) {
        success?.call(ApiThirdPayRecharge.fromMap(r.data['data']));
      },
      fail: (int code, String msg) {
        fail?.call(code, msg);
      },
    );
  }
}

class ApiThirdPayRecharge {
  ApiThirdPayRecharge({
    required this.eventId,
    required this.frontLoadFlag,
    required this.response,
    required this.thirdPayId,
  });

  final String eventId;
  final int frontLoadFlag;
  final String response;
  final String thirdPayId;

  factory ApiThirdPayRecharge.fromMap(Map<String, dynamic> json) => ApiThirdPayRecharge(
        eventId: json["eventId"],
        frontLoadFlag: json["frontLoadFlag"],
        response: json["response"],
        thirdPayId: json["thirdPayId"],
      );
}
