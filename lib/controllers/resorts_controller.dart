import 'package:get/get.dart';
import 'package:skimaps/models/resort.dart';
import 'package:skimaps/services/distance_service.dart';
import 'package:skimaps/services/http_service.dart';
import 'package:skimaps/services/location_service.dart';

class ResortsController extends GetxController {
  int currentResortIndex = -1;
  int selectedNearbyIndex = -1;
  RxBool gettingElevation = false.obs;

  LocationModel selectedResortLocation =
      LocationModel(latitude: 0, longitude: 0);
  LocationModel currentLocation = LocationModel(latitude: 0, longitude: 0);

  ResortsList resortsList = ResortsList(listOfResorts: []);
  List<Resort> nearByResorts = [];

  List<double> nearByResortsDistances = [];
  List<double> elevations = [];

  Future<int> init() async {
    resortsList = await fetchResortsList();

    currentLocation = await LocationServices.getUserLocation();
    if (resortsList.listOfResorts.isEmpty) {
      return -1;
    } else if (currentLocation.latitude == 0 &&
        currentLocation.longitude == 0) {
      return 0;
    } else {
      return 1;
    }
  }

  setElevationForResort() async {
    gettingElevation.value = true;
    resortsList.listOfResorts[selectedNearbyIndex].elevation =
        await LocationServices.getElevation(selectedResortLocation);
    gettingElevation.value = false;
  }

  setResortIndex(LocationModel location) {
    int index = resortsList.listOfResorts
        .indexWhere((resort) => resort.location == location);
    currentResortIndex = index;

    selectedResortLocation = resortsList.listOfResorts[index].location;
    int maxNearByLength = resortsList.listOfResorts.length > 5
        ? 5
        : resortsList.listOfResorts.length;
    print("1" + resortsList.listOfResorts[index].name);
    final tempResort = resortsList.listOfResorts;
    nearByResorts = DistanceService.findClosestResorts(
        selectedResortLocation, tempResort, maxNearByLength);
    print("2" + resortsList.listOfResorts[index].name);

    nearByResortsDistances = DistanceService.getDistances(
      selectedResortLocation,
      nearByResorts,
    );
    currentResortIndex = index;
    print("3" + resortsList.listOfResorts[index].name);
  }
}
