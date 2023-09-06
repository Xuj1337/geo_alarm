// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) => Alarm(
      createdAt: DateTime.parse(json['createdAt'] as String),
      routes: (json['routes'] as List<dynamic>)
          .map((e) => AlarmRoute.fromJson(e as Map<String, dynamic>))
          .toSet(),
      wakeUpTimeout: json['wakeUpTimeout'] as int,
    );

Map<String, dynamic> _$AlarmToJson(Alarm instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'routes': instance.routes,
      'wakeUpTimeout': instance.wakeUpTimeout,
    };

AlarmRoute _$AlarmRouteFromJson(Map<String, dynamic> json) => AlarmRoute(
      from: Address.fromJson(json['from'] as Map<String, dynamic>),
      to: Address.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlarmRouteToJson(AlarmRoute instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      location: const ListLatLngConverter().fromJson(json['location'] as List),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'location': const ListLatLngConverter().toJson(instance.location),
      'name': instance.name,
    };
