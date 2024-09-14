import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/app_navigation_controller.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/controllers/theme_controller.dart';
import 'package:skimaps/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key}) {}

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Get.put(AppNavigationController(), tag: 'navigationController');
    Get.put(ResortsController(), tag: 'resortsController');
    Get.put(ThemeController(), tag: 'themeController');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find(tag: 'themeController');

    return GetMaterialApp(
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Ski Maps',
      home: const SplashScreen(),
    );
  }
}
