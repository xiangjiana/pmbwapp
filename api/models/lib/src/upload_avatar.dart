import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UploadAvatar {
  UploadAvatar({
    required this.imgUrl,
    required this.topImageUrl,
    required this.id,
  });

  final String imgUrl;
  final String topImageUrl;
  final String id;

  UploadAvatar copyWith({
    String? imgUrl,
    String? topImageUrl,
    String? id,
  }) =>
      UploadAvatar(
          imgUrl: imgUrl ?? this.imgUrl,
          topImageUrl: imgUrl ?? this.topImageUrl,
          id: id ?? this.id);
}
