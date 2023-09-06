import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/config.dart';
import 'package:geo_alarm_riverpod/core_ui/core_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapRouteBuilderServiceProvider = Provider<_MapRouteBuilderService>((ref) {
  return _MapRouteBuilderService(ref);
});

class _MapRouteBuilderService {
  final Ref ref;

  _MapRouteBuilderService(this.ref);

  Future<Polyline> generateRoute(LatLng start, LatLng end) async {
    List<LatLng> polylineCoordinates = [];

    final polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(end.latitude, end.longitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      for (final point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    final id = PolylineId('${start.toString()}-${end.toString()}');

    Polyline polyline = Polyline(
      polylineId: id,
      color: kColorPrimary,
      points: polylineCoordinates,
      width: 3,
    );

    return polyline;
  }
}
