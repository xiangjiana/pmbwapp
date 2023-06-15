import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/src/venue.dart';

@jsonSerializable
class VenueTypeCodeAndVenues {
  VenueTypeCodeAndVenues({
    venueList,
    required this.venueTypeCode,
    required this.venueTypeIconUrl,
    required this.imageType,
  }){
    this.venueList=venueList.cast<Venue>();
  }

  late final List<Venue> venueList;
  final String venueTypeCode;
  final String venueTypeIconUrl;
    int imageType = 0;

  Venue? venueSelected;
  
  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'venueTypeCode': venueTypeCode,
        'venueList': venueList,
      };
}
