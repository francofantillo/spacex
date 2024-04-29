import 'package:flutter/material.dart';
import 'package:spacex/Models/launchpads.dart';
import 'package:spacex/Models/rocketlaunch.dart';
import 'package:spacex/Networking/httpclient.dart';
import 'Models/rockets.dart';

class DataProvider with ChangeNotifier {
  final RocketHTTPClient _launchService = RocketHTTPClient();
  List<RocketLaunch> _launches = [];
  List<RocketLaunch> get launches => _launches;
  List<LaunchPad> _launchpads = [];
  List<LaunchPad> get launchpads => _launchpads;
  List<Rocket> _rockets = [];
  List<Rocket> get rockets => _rockets;

  Future<void> fetchStartUp() async {
    List<RocketLaunch> upcoming = await _launchService.fetchUpcomingLaunches();
    List<RocketLaunch> past = await _launchService.fetchPastLaunches();
    _launchpads = await _launchService.fetchLaunchpads(true);
    _rockets = await _launchService.fetchRockets(true);
    List<RocketLaunch> all = [];
    all.addAll(past);
    all.addAll(upcoming);
    all.sort((a, b) => a.date_unix!.compareTo(b.date_unix!));
    _launches = all.reversed.toList();
    notifyListeners();
  }

  LaunchPad findLaunchpad(RocketLaunch launch) {
    LaunchPad launchpad = Helpers.findById(_launchpads, launch.launchpad!);
    return launchpad;
  }

  Rocket findRocket(RocketLaunch launch) {
    Rocket rocket = Helpers.findById(_rockets, launch.rocket!);
    return rocket;
  }
}

class Helpers {
  static findById(list, String id) {
    findById(obj) => obj.id == id;
    var result = list.where(findById);
    return result.length > 0 ? result.first : null;
  }
}
