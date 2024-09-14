import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/services/share_services.dart';
import 'package:skimaps/views/styles.dart';
import 'package:skimaps/views/widgets/google_maps.dart';
import 'package:skimaps/views/widgets/my_app_bar.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  ResortsController resortsController = Get.find(tag: 'resortsController');

  @override
  void initState() {
    super.initState();

    resortsController.setElevationForResort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            MapScreen(
                currentLocation: resortsController
                    .nearByResorts[resortsController.selectedNearbyIndex]
                    .location),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Theme.of(context).hintColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 78.0),
                      child: Divider(
                        color: Color(0xffD9D9D9),
                        thickness: 4.5,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          resortsController
                              .nearByResorts[
                                  resortsController.selectedNearbyIndex]
                              .name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${resortsController.nearByResortsDistances[resortsController.selectedNearbyIndex].toStringAsFixed(2)} km",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'Natural Reserve',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${resortsController.nearByResorts[resortsController.selectedNearbyIndex].location.latitude}, ${resortsController.nearByResorts[resortsController.selectedNearbyIndex].location.longitude}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Elevation',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() {
                              return resortsController.gettingElevation.isTrue
                                  ? const SizedBox()
                                  : Text(
                                      '${resortsController.resortsList.listOfResorts[resortsController.selectedNearbyIndex].elevation.toStringAsFixed(2)} m',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    );
                            })
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            // Get.to(RouteScreen(
                            //   currentLocation:
                            //       resortsController.selectedResortLocation,
                            //   destinationLocation: resortsController
                            //       .nearByResorts[
                            //           resortsController.selectedNearbyIndex]
                            //       .location,
                            // ))
                          },
                          child: Container(
                            height: 60,
                            width: 160,
                            decoration: const BoxDecoration(
                              color: Styles.mainColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      AssetImage('assets/direction.png'),
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Route To',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            shareGoogleMapString(resortsController
                                .nearByResorts[
                                    resortsController.selectedNearbyIndex]
                                .location),
                          },
                          child: Container(
                            height: 60,
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(AssetImage('assets/share.png'),
                                        color: Theme.of(context).primaryColor),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
