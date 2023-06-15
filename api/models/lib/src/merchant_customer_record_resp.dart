import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MerchantCustomerRecordResp {
  MerchantCustomerRecordResp({
    required this.memberUrl,
    required this.merchantCode,
    required this.merchantId,
    required this.proxyUrl,
  });

  final String memberUrl;
  final String merchantCode;
  final num merchantId;
  final String proxyUrl;
}
