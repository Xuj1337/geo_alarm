import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/core_logic/provider/map_provider.dart';
import 'package:geo_alarm_riverpod/core_ui/common/common.dart';
import 'package:geo_alarm_riverpod/core_ui/components/button.dart';
import 'package:geo_alarm_riverpod/core_ui/core_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class SelectMapLocationView extends ConsumerStatefulWidget {
  const SelectMapLocationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectMapLocationViewState();
}

class _SelectMapLocationViewState extends ConsumerState<SelectMapLocationView> {
  CameraPosition? _center;
  CameraPosition? _position;
  late PanelController _controller;
  @override
  void initState() {
    _controller = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _controller,
        borderRadius: KBorderRadius.t20,
        padding: KEdgeInsets.a24,
        minHeight: 130,
        maxHeight: 130,
        isDraggable: false,
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: ref.watch(currentMapLocationProvider),
              onCameraMove: (position) {
                _center = position;
              },
              onCameraIdle: () {
                setState(() {
                  _position = _center;
                });
              },
            ),
            const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.add_location_rounded,
                size: 40,
              ),
            ),
          ],
        ),
        panelBuilder: () {
          if (_position == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${_position!.target.longitude} ${_position!.target.longitude}',
              ),
              KSizedBox.h20,
              SizedBox(
                  width: double.infinity,
                  child: KElevatedButton.medium(
                    label: const Text('Применить'),
                    onPressed: () {
                      Navigator.of(context).pop<CameraPosition>(_position);
                    },
                  )),
            ],
          );
        },
      ),
    );
  }
}
