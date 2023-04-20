import 'package:furniture_shoping/controller/favoutire_controller.dart';
import 'package:furniture_shoping/controller/dashboard_screen_controller.dart';
import 'package:furniture_shoping/controller/homescreen_controller.dart';
import 'package:furniture_shoping/controller/notificationscreen_controller.dart';
import 'package:furniture_shoping/controller/profilescreen_controller.dart';
import 'package:get/get.dart';

class DashboardScreenBinding extends Bindings{


  @override
  void dependencies() {

     Get.lazyPut<FavouriteController>(() => FavouriteController());
     Get.lazyPut<DashBoardScreenController>(() => DashBoardScreenController());
     Get.lazyPut<HomeScreenController>(() => HomeScreenController());
     Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
     Get.lazyPut<NotificationScreenController>(() => NotificationScreenController());

    // TODO: implement dependencies
  }

}