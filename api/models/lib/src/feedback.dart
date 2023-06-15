import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Feedback {
  Feedback({
    required this.accountType,
    required this.createDt,
    required this.id,
    required this.labelName,
    required this.levelId,
    required this.merchantId,
    required this.merchantName,
    required this.problemDescribe,
    required this.problemType,
    required this.url,
    required this.userName,
  });

  final int accountType;
  final String createDt;
  final String id;
  final String labelName;
  final int levelId;
  final String merchantId;
  final String merchantName;
  final String problemDescribe;
  final int problemType;
  final String url;
  final String userName;
}
