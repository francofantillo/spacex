// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPad _$LaunchPadFromJson(Map<String, dynamic> json) => LaunchPad(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      fullName: json['fullName'] as String,
      locality: json['locality'] as String,
      region: json['region'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      launchAttempts: (json['launchAttempts'] as num).toInt(),
      launchSuccesses: (json['launchSuccesses'] as num).toInt(),
      rockets:
          (json['rockets'] as List<dynamic>).map((e) => e as String).toList(),
      timezone: json['timezone'] as String,
      launches:
          (json['launches'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      details: json['details'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$LaunchPadToJson(LaunchPad instance) => <String, dynamic>{
      'images': instance.images,
      'name': instance.name,
      'fullName': instance.fullName,
      'locality': instance.locality,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'launchAttempts': instance.launchAttempts,
      'launchSuccesses': instance.launchSuccesses,
      'rockets': instance.rockets,
      'timezone': instance.timezone,
      'launches': instance.launches,
      'status': instance.status,
      'details': instance.details,
      'id': instance.id,
    };
