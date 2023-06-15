import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AvatarParam {
  AvatarParam({
    required this.topImagesUrl,
  });

  final String topImagesUrl;
}
