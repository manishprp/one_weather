import 'package:geolocator/geolocator.dart';
import '../model/location_model.dart';

LocationModel locationModel = LocationModel(0, 0, "");
Future<LocationModel> getCurrentLocation() async {
  try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next step is to inform the user and guide
        // them to the settings page.
        return locationModel;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return locationModel;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LocationModel(position.latitude, position.longitude, "");
  } catch (e) {
    return locationModel;
  }
}
