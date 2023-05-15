import 'package:furniture_shoping/controller/setting_controller/profile_setting_controller.dart';
import 'package:get/get.dart';

class ProfileSettingBinding extends Bindings{


  @override
  void dependencies() {
    Get.lazyPut<ProfileSettingController>(() => ProfileSettingController());
    // TODO: implement dependencies
  }

}