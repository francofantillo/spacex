import 'package:flutter_test/flutter_test.dart';
import '../lib/DataProvider/dataproviderinterface.dart';
import 'mockdataprovider.dart';
import '../lib/Models/rocketlaunch.dart';

void main() {
  group('DataProvider', () {
    late DataProviderInterface dataProvider;

    // Set up the DataProvider instance before each test
    setUp(() {
      dataProvider = MockDataProvider();
    });

    test('fetchStartUp', () async {
      // Ensure that launches, launchpads, and rockets are initially empty
      expect(dataProvider.launches.isEmpty, true);
      expect(dataProvider.launchpads.isEmpty, true);
      expect(dataProvider.rockets.isEmpty, true);

      // Call fetchStartUp to fetch data
      await dataProvider.fetchStartUp();

      // Ensure that launches, launchpads, and rockets are not empty after fetching data
      expect(dataProvider.launches.isNotEmpty, true);
      expect(dataProvider.launchpads.isNotEmpty, true);
      expect(dataProvider.rockets.isNotEmpty, true);
    });

    test('Find launchpad', () async {
      await dataProvider.fetchStartUp();

      RocketLaunch dummyLaunch = RocketLaunch(
        rocket: 'dummy_rocket_id',
        launchpad: 'dummy_launch_pad_id',
        name: 'Dummy Launch',
        date_unix: DateTime
            .now()
            .millisecondsSinceEpoch ~/ 1000,
        // Current timestamp in seconds
        date_local: DateTime.now()
            .toLocal()
            .toString(), // Current local date time
      );

      await dataProvider.fetchStartUp();

      var pad = dataProvider.findLaunchpad(dummyLaunch);

      expect(pad.id, 'dummy_launch_pad_id');
    });

    test('Find rocket', () async {
      await dataProvider.fetchStartUp();

      RocketLaunch dummyLaunch = RocketLaunch(
        rocket: 'dummy_rocket_id',
        launchpad: 'dummy_launch_pad_id',
        name: 'Dummy Launch',
        date_unix: DateTime
            .now()
            .millisecondsSinceEpoch ~/ 1000,
        // Current timestamp in seconds
        date_local: DateTime.now()
            .toLocal()
            .toString(), // Current local date time
      );

      await dataProvider.fetchStartUp();

      var rocket = dataProvider.findRocket(dummyLaunch);

      expect(rocket.id, 'dummy_rocket_id');
    });
  });
}