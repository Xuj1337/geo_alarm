import 'package:geo_alarm_riverpod/utils/utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLocationProvider = FutureProvider<LatLng?>((ref) async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ref.noticeService.alertError('Включите службы геолокации');
    return null;
  }
  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ref.noticeService.alertError('Доступ к местоположению отклонен');
      return null;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.whileInUse ||
        permission != LocationPermission.always) {
      ref.noticeService.alertError('Доступ к местоположению отклонен');
      return null;
    }
  }
  final position = await Geolocator.getCurrentPosition();
  return LatLng(
    position.latitude,
    position.longitude,
  );
});
