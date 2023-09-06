// Flutter imports:

import 'dart:async';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/features/map/logic/map_logic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core_logic/provider/map_provider.dart';

/// key stateful-виджета действий над картой
// final mapActionsKeyProvider = Provider((ref) {
//   return MapActionsKey();
// });

/// миксин действий на картой
/// расширяется Stateful-виджетом карты с передачей [onMapCreated] виджету [GoogleMap]
mixin MapActions<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();

  Future<GoogleMapController>? get controllerFuture =>
      controllerCompleter.isCompleted ? controllerCompleter.future : null;

  @protected
  Future<void> onMapCreated(GoogleMapController controller) async {
    this.controllerCompleter.complete(controller);

    final userLocation = await ref.watch(userLocationProvider.future);
    if (userLocation != null) {
      final cameraPosition = CameraPosition(target: userLocation, zoom: 13);
      ref.read(currentMapLocationProvider.notifier).state = cameraPosition;
      ref.read(userMapLocationProvider.notifier).state = userLocation;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  Future<bool> animateCamera(CameraUpdate cameraUpdate) async {
    final controller = await controllerFuture;
    if (controller != null) {
      await controller.animateCamera(cameraUpdate);
      return true;
    } else {
      return false;
    }
  }

  Future<LatLngBounds?> getVisibleRegion() async {
    final controller = await controllerFuture;
    if (controller != null) {
      final region = await controller.getVisibleRegion();
      return region;
    } else {
      return null;
    }
  }
}

typedef MapActionsKey<T extends ConsumerStatefulWidget>
    = GlobalKey<MapActions<T>>;
