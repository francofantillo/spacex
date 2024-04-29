import 'package:json_annotation/json_annotation.dart';
part 'rocketlaunch.g.dart';

@JsonSerializable()
class Fairings {
  bool? reused;
  bool? recovery_attempt;
  bool? recovered;
  List<String>? ships;

  Fairings({this.reused, this.recovery_attempt, this.recovered, this.ships});

  factory Fairings.fromJson(Map<String, dynamic> json) =>
      _$FairingsFromJson(json);

  Map<String, dynamic> toJson() => _$FairingsToJson(this);
}

@JsonSerializable()
class Links {
  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  String? presskit;
  String? webcast;
  String? youtube_id;
  String? article;
  String? wikipedia;

  Links(
      {this.patch,
        this.reddit,
        this.flickr,
        this.presskit,
        this.webcast,
        this.youtube_id,
        this.article,
        this.wikipedia});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  Map<String, dynamic> toJson() => _$PatchToJson(this);
}

@JsonSerializable()
class Reddit {
  String? campaign;
  String? launch;
  String? media;
  String? recovery;

  Reddit({this.campaign, this.launch, this.media, this.recovery});

  factory Reddit.fromJson(Map<String, dynamic> json) => _$RedditFromJson(json);

  Map<String, dynamic> toJson() => _$RedditToJson(this);
}

@JsonSerializable()
class Flickr {
  List<String>? small;
  List<String>? original;

  Flickr({this.small, this.original});

  factory Flickr.fromJson(Map<String, dynamic> json) => _$FlickrFromJson(json);

  Map<String, dynamic> toJson() => _$FlickrToJson(this);
}

@JsonSerializable()
class Cores {
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landing_attempt;
  bool? landing_success;
  String? landing_type;
  String? landpad;

  Cores(
      {this.core,
        this.flight,
        this.gridfins,
        this.legs,
        this.reused,
        this.landing_attempt,
        this.landing_success,
        this.landing_type,
        this.landpad});

  factory Cores.fromJson(Map<String, dynamic> json) => _$CoresFromJson(json);

  Map<String, dynamic> toJson() => _$CoresToJson(this);
}

@JsonSerializable()
class RocketLaunch {
  Fairings? fairings;
  Links? links;
  String? static_fire_date_utc;
  int? static_fire_date_unix;
  bool? net;
  String rocket;
  bool? success;
  String? details;
  List<String>? payloads;
  String launchpad;
  int? flight_number;
  String name;
  String? date_utc;
  int date_unix;
  String? date_local;
  String? date_precision;
  bool? upcoming;
  List<Cores>? cores;
  bool? auto_update;
  bool? tbd;
  String? launch_library_id;
  String? id;

  RocketLaunch(
      {this.fairings,
        this.links,
        this.static_fire_date_utc,
        this.static_fire_date_unix,
        this.net,
        required this.rocket,
        this.success,
        this.details,
        this.payloads,
        required this.launchpad,
        this.flight_number,
        required this.name,
        this.date_utc,
        required this.date_unix,
        this.date_local,
        this.date_precision,
        this.upcoming,
        this.cores,
        this.auto_update,
        this.tbd,
        this.launch_library_id,
        this.id});

  factory RocketLaunch.fromJson(Map<String, dynamic> json) =>
      _$RocketLaunchFromJson(json);

  Map<String, dynamic> toJson() => _$RocketLaunchToJson(this);
}