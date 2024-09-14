import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/controllers/theme_controller.dart';
import 'package:skimaps/views/privacy_policy.dart';
import 'package:skimaps/views/styles.dart';
import 'package:skimaps/views/terms_and_usage.dart';
import 'package:skimaps/views/widgets/my_app_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final ThemeController themeController = Get.find(tag: 'themeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Theme",
                            style: TextStyle(
                                color: Styles.darkColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                ImageIcon(AssetImage("assets/privacy.png"),
                                    color: Styles.mainColor),
                                SizedBox(width: 10),
                                Text("Dark Theme",
                                    style: TextStyle(
                                        color: Styles.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            ObxValue(
                              (data) => Switch(
                                activeColor: Styles.darkColor,
                                activeTrackColor: Styles.lightPurpleColor,
                                value: themeController.isDarkTheme.value,
                                onChanged: (val) {
                                  print(val);
                                  themeController.isDarkTheme.value = val;
                                  themeController.saveThemeStatus();
                                },
                              ),
                              false.obs,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Legal",
                            style: TextStyle(
                                color: Styles.darkColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: GestureDetector(
                            onTap: () => {Get.to(PrivacyPolicy())},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(AssetImage("assets/privacy.png"),
                                        color: Styles.mainColor),
                                    SizedBox(width: 10),
                                    Text("Privacy Policy",
                                        style: TextStyle(
                                            color: Styles.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                ImageIcon(AssetImage("assets/arrow.png"),
                                    color: Styles.mainColor),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: GestureDetector(
                            onTap: () => {Get.to(TermsAndUsage())},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(AssetImage("assets/terms.png"),
                                        color: Styles.mainColor),
                                    SizedBox(width: 10),
                                    Text("Terms of use",
                                        style: TextStyle(
                                            color: Styles.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                ImageIcon(AssetImage("assets/arrow.png"),
                                    color: Styles.mainColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Other",
                            style: TextStyle(
                                color: Styles.darkColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ImageIcon(AssetImage("assets/feedback.png"),
                                      color: Styles.mainColor),
                                  SizedBox(width: 10),
                                  Text("Feedback",
                                      style: TextStyle(
                                          color: Styles.blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              ImageIcon(AssetImage("assets/arrow.png"),
                                  color: Styles.mainColor),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ImageIcon(AssetImage("assets/share.png"),
                                      color: Styles.mainColor),
                                  SizedBox(width: 10),
                                  Text("Share App",
                                      style: TextStyle(
                                          color: Styles.blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              ImageIcon(AssetImage("assets/arrow.png"),
                                  color: Styles.mainColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
