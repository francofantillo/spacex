
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:spacex/Models/launchpads.dart';
import 'package:spacex/Models/rocketlaunch.dart';
import 'package:spacex/Models/rockets.dart';

class RocketHTTPClient {
  final Dio _dio = Dio();

  Future<List<RocketLaunch>> fetchPastLaunches() async {
    return _fetchData(Endpoints.past.url.toString());
  }

  Future<List<RocketLaunch>> fetchUpcomingLaunches() async {
    return _fetchData(Endpoints.upcoming.url.toString());
  }

  Future<List<Rocket>> fetchRockets(bool withCache) async {
    return _fetchData(Endpoints.rockets.url.toString());
  }

  Future<List<LaunchPad>> fetchLaunchpads(bool withCache) async {
    return _fetchData(Endpoints.launchpads.url.toString());
  }

  Future<List<T>> _fetchData<T>(String urlString) async {
    try {
      final response = await _dio.get(urlString);
      final List<dynamic> responseData = response.data;
      return responseData.map((json) => _fromJson<T>(json)).toList();
    } catch (error) {
      debugPrint('Error fetching data: $error');
      return [];
    }
  }

  T _fromJson<T>(dynamic json) {
    if (T == RocketLaunch) {
      return RocketLaunch.fromJson(json) as T;
    } else if (T == Rocket) {
      return Rocket.fromJson(json) as T;
    } else if (T == LaunchPad) {
      return LaunchPad.fromJson(json) as T;
    } // Add more cases for other types if needed
    throw Exception("Unknown type");
  }
}

class Endpoint {
  final String path;
  final List<Map<String, String>> queryItems;

  Endpoint({required this.path, this.queryItems = const []});

  Uri get url {
    final uri = Uri(
      scheme: 'https',
      host: 'api.spacexdata.com',
      path: '/' + path,
      queryParameters: Map.fromEntries(queryItems.map((item) => MapEntry(item.keys.first, item.values.first))),
    );

    return uri;
  }
}

extension Endpoints on Endpoint {
  static Endpoint get upcoming {
    return Endpoint(path: 'v5/launches/upcoming');
  }
  static Endpoint get past {
    return Endpoint(path: 'v5/launches/past');
  }
  static Endpoint get rockets {
    return Endpoint(path: 'v4/rockets');
  }
  static Endpoint get launchpads {
    return Endpoint(path: 'v4/launchpads');
  }
}