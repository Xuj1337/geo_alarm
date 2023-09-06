import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/features/map/logic/services/map_route_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core_logic/provider/map_provider.dart';

final currentRouteProvider = FutureProvider.autoDispose<Polyline?>((ref) async {
  final route = ref.watch(currentAlarmRouteProvider);
  if (route != null) {
    final polyline = await ref
        .read(mapRouteBuilderServiceProvider)
        .generateRoute(route.from.location, route.to.location);
    return polyline;
  }
  return null;
});

final mapPolylinesProvider = Provider.autoDispose<Set<Polyline>>((ref) {
  final route = ref.watch(currentRouteProvider).asData?.value;
  if (route != null) {
    return {route};
  }
  return {};
});
