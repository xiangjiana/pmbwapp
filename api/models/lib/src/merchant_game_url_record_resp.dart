import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MerchantGameUrlRecordResp {
  MerchantGameUrlRecordResp({
    required this.downUrl,
    required this.h5Url,
    required this.merchantCode,
    required this.merchantId,
    required this.pcUrl,
  });

  final String downUrl;
  final String h5Url;
  final String merchantCode;
  final num merchantId;
  final String pcUrl;
}
