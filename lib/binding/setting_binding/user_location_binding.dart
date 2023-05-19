import 'package:furniture_shoping/controller/setting_controller/user_location_contoller.dart';
import 'package:get/get.dart';

class UserLocationBinding extends Bindings {
  @override
  void dependencies() {


    Get.lazyPut<UserLocationController>(() => UserLocationController());
    // TODO: implement dependencies

  }


}
