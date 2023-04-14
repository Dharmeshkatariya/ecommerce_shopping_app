import 'package:furniture_shoping/controller/loginscreen_controller.dart';
import 'package:get/get.dart';

class LogInScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LogInScreenController>(() => LogInScreenController());
    // TODO: implement dependencies
  }

}