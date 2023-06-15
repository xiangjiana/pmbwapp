import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Domain {
  Domain({
    required this.id,
    required this.domain,
    required this.domainType,
    required this.status,
    required this.domainDesc,
    required this.createdBy,
    required this.createdAt,
    required this.updatedBy,
    required this.updatedAt,
  });

  final num id;
  final String domain;
  final int domainType;
  final int status;
  final String domainDesc;
  final String createdBy;
  final String createdAt;
  final String updatedBy;
  final String updatedAt;
}
