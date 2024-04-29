// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocketlaunch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fairings _$FairingsFromJson(Map<String, dynamic> json) => Fairings(
      reused: json['reused'] as bool?,
      recovery_attempt: json['recovery_attempt'] as bool?,
      recovered: json['recovered'] as bool?,
      ships:
          (json['ships'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FairingsToJson(Fairings instance) => <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recovery_attempt,
      'recovered': instance.recovered,
      'ships': instance.ships,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      patch: json['patch'] == null
          ? null
          : Patch.fromJson(json['patch'] as Map<String, dynamic>),
      reddit: json['reddit'] == null
          ? null
          : Reddit.fromJson(json['reddit'] as Map<String, dynamic>),
      flickr: json['flickr'] == null
          ? null
          : Flickr.fromJson(json['flickr'] as Map<String, dynamic>),
      presskit: json['presskit'] as String?,
      webcast: json['webcast'] as String?,
      youtube_id: json['youtube_id'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch,
      'reddit': instance.reddit,
      'flickr': instance.flickr,
      'presskit': instance.presskit,
      'webcast': instance.webcast,
      'youtube_id': instance.youtube_id,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
    };

Patch _$PatchFromJson(Map<String, dynamic> json) => Patch(
      small: json['small'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };

Reddit _$RedditFromJson(Map<String, dynamic> json) => Reddit(
      campaign: json['campaign'] as String?,
      launch: json['launch'] as String?,
      media: json['media'] as String?,
      recovery: json['recovery'] as String?,
    );

Map<String, dynamic> _$RedditToJson(Reddit instance) => <String, dynamic>{
      'campaign': instance.campaign,
      'launch': instance.launch,
      'media': instance.media,
      'recovery': instance.recovery,
    };

Flickr _$FlickrFromJson(Map<String, dynamic> json) => Flickr(
      small:
          (json['small'] as List<dynamic>?)?.map((e) => e as String).toList(),
      original: (json['original'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FlickrToJson(Flickr instance) => <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };

Cores _$CoresFromJson(Map<String, dynamic> json) => Cores(
      core: json['core'] as String?,
      flight: (json['flight'] as num?)?.toInt(),
      gridfins: json['gridfins'] as bool?,
      legs: json['legs'] as bool?,
      reused: json['reused'] as bool?,
      landing_attempt: json['landing_attempt'] as bool?,
      landing_success: json['landing_success'] as bool?,
      landing_type: json['landing_type'] as String?,
      landpad: json['landpad'] as String?,
    );

Map<String, dynamic> _$CoresToJson(Cores instance) => <String, dynamic>{
      'core': instance.core,
      'flight': instance.flight,
      'gridfins': instance.gridfins,
      'legs': instance.legs,
      'reused': instance.reused,
      'landing_attempt': instance.landing_attempt,
      'landing_success': instance.landing_success,
      'landing_type': instance.landing_type,
      'landpad': instance.landpad,
    };

RocketLaunch _$RocketLaunchFromJson(Map<String, dynamic> json) => RocketLaunch(
      fairings: json['fairings'] == null
          ? null
          : Fairings.fromJson(json['fairings'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      static_fire_date_utc: json['static_fire_date_utc'] as String?,
      static_fire_date_unix: (json['static_fire_date_unix'] as num?)?.toInt(),
      net: json['net'] as bool?,
      rocket: json['rocket'] as String,
      success: json['success'] as bool?,
      details: json['details'] as String?,
      payloads: (json['payloads'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      launchpad: json['launchpad'] as String,
      flight_number: (json['flight_number'] as num?)?.toInt(),
      name: json['name'] as String,
      date_utc: json['date_utc'] as String?,
      date_unix: (json['date_unix'] as num).toInt(),
      date_local: json['date_local'] as String?,
      date_precision: json['date_precision'] as String?,
      upcoming: json['upcoming'] as bool?,
      cores: (json['cores'] as List<dynamic>?)
          ?.map((e) => Cores.fromJson(e as Map<String, dynamic>))
          .toList(),
      auto_update: json['auto_update'] as bool?,
      tbd: json['tbd'] as bool?,
      launch_library_id: json['launch_library_id'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RocketLaunchToJson(RocketLaunch instance) =>
    <String, dynamic>{
      'fairings': instance.fairings,
      'links': instance.links,
      'static_fire_date_utc': instance.static_fire_date_utc,
      'static_fire_date_unix': instance.static_fire_date_unix,
      'net': instance.net,
      'rocket': instance.rocket,
      'success': instance.success,
      'details': instance.details,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'flight_number': instance.flight_number,
      'name': instance.name,
      'date_utc': instance.date_utc,
      'date_unix': instance.date_unix,
      'date_local': instance.date_local,
      'date_precision': instance.date_precision,
      'upcoming': instance.upcoming,
      'cores': instance.cores,
      'auto_update': instance.auto_update,
      'tbd': instance.tbd,
      'launch_library_id': instance.launch_library_id,
      'id': instance.id,
    };
