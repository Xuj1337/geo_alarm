import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class ListLatLngConverter extends JsonConverter<LatLng, List<dynamic>> {
  const ListLatLngConverter();
  @override
  LatLng fromJson(List<dynamic> json) => LatLng(
        toDouble(json[1]),
        toDouble(json[0]),
      );
  @override
  List<double> toJson(LatLng object) => [object.longitude, object.latitude];

  double toDouble(dynamic value) {
    assert(value is num, 'Only num values can be converted to double');

    return (value as num).toDouble();
  }
}
