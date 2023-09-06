import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/utils.dart';

part 'alarm.g.dart';

@JsonSerializable()
class Alarm extends Equatable {
  final DateTime createdAt;
  final Set<AlarmRoute> routes;
  final int wakeUpTimeout;

  const Alarm(
      {required this.createdAt,
      required this.routes,
      required this.wakeUpTimeout});

  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmToJson(this);

  Alarm copyWith({
    DateTime? createdAt,
    Set<AlarmRoute>? routes,
    int? wakeUpTimeout,
  }) {
    return Alarm(
      createdAt: createdAt ?? this.createdAt,
      routes: routes ?? this.routes,
      wakeUpTimeout: wakeUpTimeout ?? this.wakeUpTimeout,
    );
  }

  @override
  List<Object?> get props => [createdAt, routes, wakeUpTimeout];
}

@JsonSerializable()
class AlarmRoute extends Equatable {
  final Address from;
  final Address to;

  const AlarmRoute({required this.from, required this.to});

  factory AlarmRoute.fromJson(Map<String, dynamic> json) =>
      _$AlarmRouteFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmRouteToJson(this);

  AlarmRoute copyWith({
    Address? from,
    Address? to,
  }) {
    return AlarmRoute(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object?> get props => [from, to];
}

@JsonSerializable()
@ListLatLngConverter()
class Address extends Equatable {
  final LatLng location;
  final String name;

  const Address({required this.location, required this.name});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address copyWith({
    LatLng? location,
    String? name,
  }) {
    return Address(
      location: location ?? this.location,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [location, name];
}
