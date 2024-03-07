import 'package:location/location.dart';

// Function to get user location
Future<LocationData?> getUserLocation() async {
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  Location location = Location();
  LocationData? locationData;
  try {
    // Check if location service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return locationData;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return locationData;
      }
    }

    // Get the user's location
    locationData = await location.getLocation();
  } catch (e) {
    return locationData;
  }

  return locationData;
}
