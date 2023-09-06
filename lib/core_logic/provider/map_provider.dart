import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/core_logic/models/alarm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final currentMapLocationProvider = StateProvider<CameraPosition>((ref) {
  return const CameraPosition(target: LatLng(1, 1));
});

final userMapLocationProvider = StateProvider<LatLng?>((ref) {
  return null;
});

final destinationLocationProvider = StateProvider<LatLng?>((ref) {
  return null;
});

final currentAlarmRouteProvider = Provider<AlarmRoute?>((ref) {
  final current = ref.watch(userMapLocationProvider);
  final destination = ref.watch(destinationLocationProvider);
  if (current != null && destination != null) {
    return AlarmRoute(
      from: Address(location: current, name: 'My location'),
      to: Address(location: destination, name: 'Destination'),
    );
  }
  return null;
});
