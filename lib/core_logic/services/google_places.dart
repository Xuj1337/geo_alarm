import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/config.dart';

final googlePlacesServiceProvider = Provider<_GooglePlacesService>((ref) {
  return _GooglePlacesService();
});

final class _GooglePlacesService {
  late final FlutterGooglePlacesSdk _instance;
  _GooglePlacesService() {
    _instance = FlutterGooglePlacesSdk(googleMapsApiKey);
  }

  Future<List<AutocompletePrediction>> findAutocompletePredictions(
    String query,
  ) async {
    final isInitialized = await _instance.isInitialized();
    if (isInitialized == true) {
      final prediction = await _instance.findAutocompletePredictions(query);
      return prediction.predictions;
    }

    return [];
  }
}
