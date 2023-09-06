import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/core_logic/provider/map_provider.dart';
import 'package:geo_alarm_riverpod/core_ui/core_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../logic/map_logic.dart';
import '../logic/providers/route_provider.dart';

/*
  Экран карты
 */

final mapActionsKey = MapActionsKey(debugLabel: 'search_map_view');

class MapView extends ConsumerStatefulWidget {
  MapView() : super(key: mapActionsKey);

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> with MapActions {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            polylines: ref.watch(mapPolylinesProvider),
            initialCameraPosition:
                const CameraPosition(target: LatLng(1, 1), zoom: 1),
            onMapCreated: onMapCreated,
            onCameraMove: (position) {
              ref.read(currentMapLocationProvider.notifier).state = position;
            },
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            compassEnabled: false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed('alarm');
        },
        backgroundColor: kColorPrimary,
        child: const Icon(
          Icons.alarm_add_rounded,
        ),
      ),
    );
  }
}
