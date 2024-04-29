import 'dart:async';
import '../lib/DataProvider/dataproviderinterface.dart';
import '../lib/Models/launchpads.dart';
import '../lib/Models/rocketlaunch.dart';
import '../lib/Models/rockets.dart';

class MockDataProvider implements DataProviderInterface {
  // Define lists to store mock data
  List<RocketLaunch> _launches = [];
  List<LaunchPad> _launchpads = [];
  List<Rocket> _rockets = [];

  // Implement getters for launches, launchpads, and rockets
  @override
  List<RocketLaunch> get launches => _launches;

  @override
  List<LaunchPad> get launchpads => _launchpads;

  @override
  List<Rocket> get rockets => _rockets;

  // Implement fetchStartUp method
  @override
  Future<void> fetchStartUp() async {
    // Add mock data to the lists

    RocketLaunch dummyLaunch = RocketLaunch(
      rocket: 'dummy_rocket_id',
      launchpad: 'dummy_launch_pad_id',
      name: 'Dummy Launch',
      date_unix: DateTime.now().millisecondsSinceEpoch ~/ 1000, // Current timestamp in seconds
      date_local: DateTime.now().toLocal().toString(), // Current local date time
    );

    LaunchPad dummyLaunchPad = LaunchPad(
      images: ['image_url_1', 'image_url_2'],
      name: 'Dummy Launch Pad',
      fullName: 'Dummy Launch Pad Full Name',
      locality: 'Dummy Locality',
      region: 'Dummy Region',
      latitude: 123.456, // Dummy latitude
      longitude: 78.910, // Dummy longitude
      launchAttempts: 10,
      launchSuccesses: 5,
      rockets: ['rocket_id_1', 'rocket_id_2'],
      timezone: 'Dummy Timezone',
      launches: ['launch_id_1', 'launch_id_2'],
      status: 'Dummy Status',
      details: 'Dummy Launch Pad Details',
      id: 'dummy_launch_pad_id',
    );

    Rocket dummyRocket = Rocket(
      id: 'dummy_rocket_id',
      name: 'Dummy Rocket',
      type: 'Dummy Type',
      active: true,
    );

    _launches = [dummyLaunch];
    _launchpads = [dummyLaunchPad];
    _rockets = [dummyRocket];

    // Simulate a delay to mimic network request
    await Future.delayed(const Duration(seconds: 2));

    // Notify listeners (not implemented in mock)
  }

  // Implement findLaunchpad method
  @override
  LaunchPad findLaunchpad(RocketLaunch launch) {
    // Find and return mock LaunchPad object
    return _launchpads.firstWhere((pad) => pad.id == launch.launchpad);
  }

  // Implement findRocket method
  @override
  Rocket findRocket(RocketLaunch launch) {
    // Find and return mock Rocket object
    return _rockets.firstWhere((rocket) => rocket.id == launch.rocket);
  }
}
