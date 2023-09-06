import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/core_ui/components/button.dart';
import 'package:geo_alarm_riverpod/core_ui/components/scaffold.dart';
import 'package:geo_alarm_riverpod/core_ui/core_ui.dart';
import 'package:geo_alarm_riverpod/features/alarm/logic/providers/predicted_address_provider.dart';
import 'package:geo_alarm_riverpod/features/alarm/ui/views/select_map_location_view.dart';
import 'package:geo_alarm_riverpod/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core_logic/provider/map_provider.dart';

class AlarmScreen extends ConsumerStatefulWidget {
  const AlarmScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends ConsumerState<AlarmScreen> {
  late final TextEditingController _destinationController;

  @override
  void initState() {
    super.initState();
    _destinationController = TextEditingController();
  }

  LatLng? _destination;
  @override
  Widget build(BuildContext context) {
    return KScaffold(
      title: 'Будильник',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Откуда?'),
          KSizedBox.h8,
          TextFormField(
            initialValue: 'Мое местоположение',
            readOnly: true,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.location_on_rounded)),
          ),
          KSizedBox.h20,
          const Text('Куда?'),
          KSizedBox.h8,
          TextFormField(
            controller: _destinationController,
            readOnly: true,
            onTap: () {
              ref.noticeService.bottomModal(
                const _SelectAddressModal(),
              );
            },
            decoration: InputDecoration(
              suffixIcon: _SelectLocationButton(
                onSelectLocation: (position) {
                  _destination = position.target;
                  _destinationController.text = position.target.toString();
                },
              ),
              contentPadding: KEdgeInsets.zero,
            ),
          ),
          KSizedBox.h20,
          Row(
            children: [
              const Text('Разбудить за'),
              Container(),
            ],
          ),
        ],
      ),
      bottom: Padding(
        padding: KEdgeInsets.a16,
        child: KElevatedButton.medium(
          label: const Text('Применить'),
          onPressed: () {
            ref.read(destinationLocationProvider.notifier).state = _destination;
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class _SelectAddressModal extends ConsumerStatefulWidget {
  const _SelectAddressModal({super.key});

  @override
  ConsumerState<_SelectAddressModal> createState() =>
      _SelectAddressModalState();
}

class _SelectAddressModalState extends ConsumerState<_SelectAddressModal> {
  late final TextEditingController _controller;

  String? _query;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_controllerListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _controllerListener() {
    if (_debounceTimer == null) {
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _query = _controller.text;
        });
      });
      return;
    }
    if (_debounceTimer?.isActive == false) {
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _query = _controller.text;
        });
      });
      return;
    }

    _debounceTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: KEdgeInsets.a24,
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
          ),
          KDivider.h32,
          if (_query?.isNotEmpty == true) ...[
            ref.watch(predictedAddressProvider(_query!)).when(
                  data: (data) => Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (ctx, i) => Text(data[i].fullText),
                      separatorBuilder: (ctx, i) => KSizedBox.h12,
                    ),
                  ),
                  error: (e, stackTrace) => KSizedBox.shrink,
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          ]
        ],
      ),
    );
  }
}

class _SelectLocationButton extends StatelessWidget {
  const _SelectLocationButton({required this.onSelectLocation, super.key});
  final Function(CameraPosition) onSelectLocation;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Карта',
        style: KTextStyle.body.secondaryColored,
      ),
      onPressed: () async {
        final position = await Navigator.of(context).push<CameraPosition>(
            MaterialPageRoute(builder: (ctx) => const SelectMapLocationView()));
        if (position != null) {
          onSelectLocation(position);
        }
      },
    );
  }
}
