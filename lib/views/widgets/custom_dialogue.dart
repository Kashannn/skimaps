import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skimaps/views/styles.dart';

showCustomDialogue(String title, String content) {
  Get.dialog(AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    backgroundColor: Styles.whiteColor,
    title: Center(
        child: Text(
      title,
      style: TextStyle(color: Colors.black),
    )),
    content: Text(
      content,
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Styles.mainColor)),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Styles.whiteColor),
          ))
    ],
  ));
}
//We were unable to get your location. Please check your location settings and try again.