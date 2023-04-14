import 'package:furniture_shoping/controller/dashboard_screen_controller.dart';
import 'package:get/get.dart';

class DashboardScreenBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<DashBoardScreenController>(() => DashBoardScreenController());
    // TODO: implement dependencies
  }

}