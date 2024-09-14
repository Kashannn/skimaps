import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/controllers/theme_controller.dart';
import 'package:skimaps/views/location_details.dart';
import 'package:skimaps/views/search_resort.dart';
import 'package:skimaps/views/styles.dart';
import 'package:skimaps/views/widgets/google_maps.dart';
import 'package:skimaps/views/widgets/my_app_bar.dart';

class NearBy extends StatefulWidget {
  const NearBy({super.key});

  @override
  State<NearBy> createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  ResortsController resortsController = Get.find(tag: 'resortsController');

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: myAppBar(),
      body: resortsController.nearByResorts.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select the Resort First to find Nearby Resorts.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Styles.mainColor)),
                        onPressed: () => {
                              Get.to(
                                () => const SearchResort(),
                              )
                            },
                        child: Text(
                          "Seach Resorts",
                          style: TextStyle(color: Styles.whiteColor),
                        ))
                  ],
                ),
              ),
            )
          : ListView.builder(
        shrinkWrap: false,
        itemCount: resortsController.nearByResorts.length,
        itemBuilder: (BuildContext context, int index) => NearByCard(
          index: index,
        ),
      ),
    );
  }
}

class NearByCard extends StatelessWidget {
  final int index;
  ResortsController resortsController = Get.find(tag: 'resortsController');
  final ThemeController themeController = Get.find(tag: 'themeController');

  NearByCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MapScreen(
            currentLocation: resortsController.nearByResorts[index].location,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: themeController.isDarkTheme.value
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resortsController.nearByResorts[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                  color: Theme.of(context).primaryColor,
                                  image: AssetImage('assets/location.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${resortsController.nearByResortsDistances[index].toStringAsFixed(2)} km',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //cercular button
                      GestureDetector(
                        onTap: () {
                          resortsController.selectedNearbyIndex = index;
                          Get.to(const LocationDetails());
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 190, 163, 244),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Styles.whiteColor
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
