import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BankManageDownParam {
  BankManageDownParam({
    required this.currency,
  });

  final String currency;
}
