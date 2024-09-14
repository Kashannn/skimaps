import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/models/resort.dart';
import 'package:skimaps/views/app_navigation.dart';
import 'package:skimaps/views/styles.dart';

import 'widgets/my_app_bar.dart';

class SearchResort extends StatefulWidget {
  const SearchResort({super.key});

  @override
  _SearchResortState createState() => _SearchResortState();
}

class _SearchResortState extends State<SearchResort> {
  late List<Resort> _filteredResorts;
  ResortsController resortsController = Get.find(tag: 'resortsController');
  @override
  void initState() {
    super.initState();
    _filteredResorts = resortsController.resortsList.listOfResorts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Styles.darkColor,
                    fontSize: 18.0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _filteredResorts = resortsController
                          .resortsList.listOfResorts
                          .where((resort) =>
                              resort.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              resort.country
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search by name or country',
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredResorts.length,
              itemBuilder: (context, index) {
                final resort = _filteredResorts[index];
                return GestureDetector(
                  onTap: () => {
                    resortsController.setResortIndex(resort.location),
                    Get.to(AppNavigation())
                  },
                  child: ListTile(
                    title: Text(resort.name),
                    subtitle: Text(resort.country),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
