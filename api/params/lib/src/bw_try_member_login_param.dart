import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BwTryMemberLoginParam {
  BwTryMemberLoginParam({
     this.appType,
     this.appVersion,
     this.deviceNo,
     this.deviceVersion,
     this.loginUrl,
  });

  final String? appType;
  final String? appVersion;
  final String? deviceNo;
  final String? deviceVersion;
  final String? loginUrl;
}
