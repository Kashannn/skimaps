import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/app_navigation_controller.dart';
import 'package:skimaps/controllers/theme_controller.dart';
import 'package:skimaps/views/home_page.dart';
import 'package:skimaps/views/near_by.dart';
import 'package:skimaps/views/settings.dart';
import 'package:skimaps/views/styles.dart';

class AppNavigation extends StatefulWidget {
  AppNavigation({Key? key}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  AppNavigationController navigationController =
      Get.find(tag: 'navigationController');
  final ThemeController themeController = Get.find(tag: 'themeController');

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const NearBy(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      navigationController.navigationIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body:
          _widgetOptions.elementAt(navigationController.navigationIndex.value),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffAEADB2),
              width: 0.3,
            ),
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            backgroundColor: themeController.isDarkTheme.isTrue
                ? Colors.black
                : Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              navigationController.navigationIndex.value == 0
                  ? BottomNavigationBarItem(
                      label: "",
                      icon: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xff7339E5)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 5.0, right: 5, top: 5, bottom: 5),
                          child: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage(
                                    'assets/search.png',
                                  ),
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Search",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  : BottomNavigationBarItem(
                      icon: ImageIcon(
                        color: themeController.isDarkTheme.value
                            ? Colors.white
                            : Colors.grey,
                        const AssetImage('assets/search.png'),
                        size: 25,
                      ),
                      label: "",
                      backgroundColor: Styles.whiteColor),
              navigationController.navigationIndex.value == 1
                  ? BottomNavigationBarItem(
                      label: "",
                      icon: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xff7339E5)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 5.0, right: 5, top: 5, bottom: 5),
                          child: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                ImageIcon(
                                  color: Colors.white,
                                  AssetImage(
                                    'assets/location.png',
                                  ),
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Nearby",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  : BottomNavigationBarItem(
                      icon: ImageIcon(
                        color: themeController.isDarkTheme.value
                            ? Colors.white
                            : Colors.grey,
                        const AssetImage('assets/location.png'),
                        size: 25,
                      ),
                      label: "",
                      backgroundColor: Styles.whiteColor),
              navigationController.navigationIndex.value == 2
                  ? BottomNavigationBarItem(
                      label: "",
                      icon: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xff7339E5)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 5.0, right: 5, top: 5, bottom: 5),
                          child: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage(
                                    'assets/settings.png',
                                  ),
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Setting",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  : BottomNavigationBarItem(
                      icon: ImageIcon(
                        color: themeController.isDarkTheme.value
                            ? Colors.white
                            : Colors.grey,
                        const AssetImage('assets/settings.png'),
                        size: 25,
                      ),
                      label: "",
                      backgroundColor: Styles.whiteColor),
            ],
            currentIndex: navigationController.navigationIndex.value,
            iconSize: 40,
            elevation: 0,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
