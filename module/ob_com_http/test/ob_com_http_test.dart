import 'dart:convert';

import 'package:ob_com_http/ob_com_http.dart';

import 'package:ob_com_http/src/utils/as_t.dart';

void main() {
  var json = '{id: 785892181550788664, thirdMerchantName: 天下支付, thirdMerchantId: 600108, useType: 1, subPayType: 1, subPayTypeName: 天下支付, sort: 0, status: 1, fastAmount: [100, 200, 300, 500, 1000, 1500, 2000, 3000, 4000, 5000], maxAmount: 0, minAmount: 0, usedAmount: 0, totalPayAmount: 0, maxPayAmount:0}';
  ApiThirdPayChannel.fromMap(jsonDecode(json));
}
