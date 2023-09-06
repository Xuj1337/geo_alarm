import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/core_logic/services/google_places.dart';

final predictedAddressProvider = FutureProvider.autoDispose
    .family<List<AutocompletePrediction>, String>((ref, address) async {
  final predicts = await ref
      .read(googlePlacesServiceProvider)
      .findAutocompletePredictions(address);
  return predicts;
});
