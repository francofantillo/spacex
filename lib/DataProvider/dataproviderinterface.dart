import '../Models/launchpads.dart';
import '../Models/rocketlaunch.dart';
import '../Models/rockets.dart';

// Define an interface for the DataProvider class
abstract class DataProviderInterface {
  // Getter for launches
  List<RocketLaunch> get launches;

  // Getter for launchpads
  List<LaunchPad> get launchpads;

  // Getter for rockets
  List<Rocket> get rockets;

  // Method to fetch startup data
  Future<void> fetchStartUp();

  // Method to find launchpad for a given launch
  LaunchPad findLaunchpad(RocketLaunch launch);

  // Method to find rocket for a given launch
  Rocket findRocket(RocketLaunch launch);
}