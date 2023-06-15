import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SelectInvitationCodeParam {
  SelectInvitationCodeParam({
    required this.invitationCode,
  });

  final String invitationCode;
}
