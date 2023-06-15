
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class CollectVenueGameParam{

  CollectVenueGameParam({
    required this.collectFlag,
    required this.collectId,
    required this.gameId,
  });
  int collectFlag;
  int collectId;
  int gameId;



}