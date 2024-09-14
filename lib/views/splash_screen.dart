import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/resorts_controller.dart';
import 'package:skimaps/controllers/theme_controller.dart';
import 'package:skimaps/views/app_navigation.dart';
import 'package:skimaps/views/home_page.dart';

import 'styles.dart';
import 'widgets/custom_dialogue.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            width: 120.0,
          ),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(
            color: Styles.mainColor,
            value: null,
            strokeWidth: 4.0,
          ),
        ],
      )),
    );
  }
}

redirect() async {
  final ResortsController resortsController = Get.find(tag: 'resortsController');
  final ThemeController themeController = Get.find(tag: 'themeController');

  int hasResort = await resortsController.init();
  await themeController.getThemeStatus();
  if (hasResort == 1) {
    Get.offAll(AppNavigation());
  } else if (hasResort == 0) {
    Get.offAll(AppNavigation());
    showCustomDialogue('Location Error',
        'We were unable to get your location. Please check your location settings and try again.');
  } else {
    Get.offAll(AppNavigation());
    showCustomDialogue('Connection Error',
        'We were unable to connect to the server. Please check your internet connection and try again.');
  }
}
