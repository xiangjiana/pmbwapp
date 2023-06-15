import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AppVersionConfigResp {

  AppVersionConfigResp({
    required this.content,
    required this.downloadUrl,
    required this.title,
    required this.updateType,
    required this.version,
  });

  final String content;
  final String downloadUrl;
  final String title;
  final int updateType;
  final String version;
}
