import 'package:furniture_shoping/controller/favoutire_controller.dart';
import 'package:furniture_shoping/controller/dashboard_screen_controller.dart';
import 'package:furniture_shoping/controller/homescreen_controller.dart';
import 'package:furniture_shoping/controller/notificationscreen_controller.dart';
import 'package:furniture_shoping/controller/profilescreen_controller.dart';
import 'package:get/get.dart';

class DashboardScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(DashBoardScreenController());
    Get.put(HomeScreenController());
    Get.put(FavouriteController());
    Get.put(NotificationScreenController());
    Get.put(ProfileScreenController());

    // TODO: implement dependencies
  }
}
