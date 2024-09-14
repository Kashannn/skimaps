import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  ThemeData darkTheme = ThemeData(
      hintColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  ThemeData lightTheme = ThemeData(
      hintColor: Colors.white,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      primaryColor: Colors.black,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));
  RxBool isDarkTheme = false.obs;

  saveThemeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);

    prefs.setBool('theme', isDarkTheme.value);
  }

  getThemeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isDarkTheme.value = prefs.getBool('theme') ?? false;

    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
  }
}
