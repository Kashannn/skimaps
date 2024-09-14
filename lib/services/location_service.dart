import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skimaps/configs/api_keys.dart';
import 'package:skimaps/models/resort.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationServices {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static Future<double> getElevation(LocationModel location) async {
    const apiKey = ApiKeys.googleMapApiKey; // Replace with your Google API key
    final url =
        'https://maps.googleapis.com/maps/api/elevation/json?locations=${location.latitude},${location.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final elevation = data['results'][0]['elevation'];
      print(elevation);
      return elevation;
    } else {
      print('Error: ${response.reasonPhrase}');
      return -2;
    }
  }

  static Future<LocationModel> getUserLocation() async {
    LatLng currentPostion;
    try {
      var position = await GeolocatorPlatform.instance.getCurrentPosition();

      currentPostion = LatLng(position.latitude, position.longitude);
    } catch (e) {
      currentPostion = const LatLng(0, 0);
    }
    return LocationModel(
        latitude: currentPostion.latitude, longitude: currentPostion.longitude);
  }
}
