import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class Summary {
  late Map<String, dynamic> result = {};

  @jsonProperty
  void unmappedSet(String name, dynamic value) {
    result[name] = value;
  }

  @jsonProperty
  Map<String, dynamic> unmappedGet() {
    return result;
  }
}