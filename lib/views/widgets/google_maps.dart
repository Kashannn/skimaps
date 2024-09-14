import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/models/resort.dart';

class MapScreen extends StatelessWidget {
  final LocationModel currentLocation;
  ResortsController resortsController = Get.find(tag: 'resortsController');

  MapScreen({super.key, required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 14,
        ),
      ),
    );
  }
}
