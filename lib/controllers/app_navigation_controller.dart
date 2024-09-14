import 'package:get/get.dart';
import 'package:skimaps/views/app_navigation.dart';
import 'package:skimaps/views/home_page.dart';
import 'package:skimaps/views/near_by.dart';
import 'package:skimaps/views/settings.dart';

class AppNavigationController extends GetxController {
  RxInt navigationIndex = 0.obs;
  changeScreen(int index) {
    navigationIndex.value = index;
    Get.offAll(AppNavigation());
  }
}
