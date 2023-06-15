import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RechargeBannerParam {
  RechargeBannerParam({
    required this.bannerFlag,
  });

  final int bannerFlag;
}
