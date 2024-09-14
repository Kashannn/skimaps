import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/app_navigation_controller.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/controllers/theme_controller.dart';
import 'package:skimaps/services/http_service.dart';
import 'package:skimaps/views/location_details.dart';
import 'package:skimaps/views/search_resort.dart';
import 'package:skimaps/views/styles.dart';

import 'widgets/google_maps.dart';
import 'widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppNavigationController navigationController =
      Get.find(tag: 'navigationController');
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledToTop = true;
  ResortsController resortsController = Get.find(tag: 'resortsController');

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        // Check if the scroll offset is at the top
        _isScrolledToTop = _scrollController.offset <= 1;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollUp() {
    if (_isScrolledToTop) {
      navigationController.changeScreen(1);
    } else {
      // Scroll to top
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(SearchResort());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              resortsController.currentResortIndex != -1
                                  ? resortsController
                                      .resortsList
                                      .listOfResorts[
                                          resortsController.currentResortIndex]
                                      .name
                                  : "Search by name or country ",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                  child: Text(
                resortsController.currentResortIndex != -1
                    ? "Selected Resort: ${resortsController.resortsList.listOfResorts[resortsController.currentResortIndex].name}"
                    : "Current Location ",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            GestureDetector(
              onTap: () async => {Get.to(SearchResort())},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: MapScreen(
                    currentLocation: resortsController.currentLocation),
              ),
            ),
            SizedBox(
              height: 200,
              child: GestureDetector(
                onPanUpdate: (details) {},
                onVerticalDragEnd: (_) => _onScrollUp(),
                child: Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 78.0),
                          child: Divider(
                            color: Color(0xffD9D9D9),
                            thickness: 4.5,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Nearby Areas',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        //Horizental scroll view
                        resortsController.currentResortIndex != -1
                            ? SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      resortsController.nearByResorts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        resortsController.selectedNearbyIndex =
                                            index;
                                        Get.to(const LocationDetails());
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(resortsController
                                              .nearByResorts[index].name),
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Select a Resort to see nearby areas.",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
