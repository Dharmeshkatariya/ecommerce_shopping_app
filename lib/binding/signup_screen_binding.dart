import 'package:furniture_shoping/controller/signup_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpScreenController>(() => SignUpScreenController());
    // TODO: implement dependencies
  }

}