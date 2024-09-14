import 'dart:math';

import 'package:skimaps/models/resort.dart';

class DistanceService {
  static double distance(LocationModel location1, LocationModel location2) {
    const earthRadius = 6371.0; // Radius of the earth in km
    final latDistance = location2.latitude - location1.latitude;
    final lonDistance = location2.longitude - location1.longitude;
    final a = sin(latDistance / 2) * sin(latDistance / 2) +
        cos(location1.latitude) *
            cos(location2.latitude) *
            sin(lonDistance / 2) *
            sin(lonDistance / 2);
    final c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  static List<Resort> findClosestResorts(
      LocationModel myLocation, List<Resort> resorts, int numberOfResorts) {
    List<Resort> sortedResorts = [...resorts];
    sortedResorts.sort((a, b) => distance(myLocation, a.location)
        .compareTo(distance(myLocation, b.location)));
    return sortedResorts.sublist(1, numberOfResorts);
  }

  static List<double> getDistances(
      LocationModel currentLocation, List<Resort> resorts) {
    final distances = <double>[];
    for (final resort in resorts) {
      distances.add(distance(currentLocation, resort.location));
    }
    return distances;
  }
}
