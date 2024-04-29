
import 'package:json_annotation/json_annotation.dart';
part 'launchpads.g.dart';


@JsonSerializable()
class LaunchPad {
  late List<String> images;
  late String name;
  late String fullName;
  late String locality;
  late String region;
  late double latitude;
  late double longitude;
  late int launchAttempts;
  late int launchSuccesses;
  late List<String> rockets;
  late String timezone;
  late List<String> launches;
  late String status;
  late String details;
  late String id;

  LaunchPad({
    required this.images,
    required this.name,
    required this.fullName,
    required this.locality,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.launchAttempts,
    required this.launchSuccesses,
    required this.rockets,
    required this.timezone,
    required this.launches,
    required this.status,
    required this.details,
    required this.id,
  });

  LaunchPad.fromJson(Map<String, dynamic> json) {
    images = json['images']['large'].cast<String>();
    name = json['name'];
    fullName = json['full_name'];
    locality = json['locality'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    launchAttempts = json['launch_attempts'];
    launchSuccesses = json['launch_successes'];
    rockets = json['rockets'].cast<String>();
    timezone = json['timezone'];
    launches = json['launches'].cast<String>();
    status = json['status'];
    details = json['details'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = {'large': images};
    data['name'] = name;
    data['full_name'] = fullName;
    data['locality'] = locality;
    data['region'] = region;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['launch_attempts'] = launchAttempts;
    data['launch_successes'] = launchSuccesses;
    data['rockets'] = rockets;
    data['timezone'] = timezone;
    data['launches'] = launches;
    data['status'] = status;
    data['details'] = details;
    data['id'] = id;
    return data;
  }
}
