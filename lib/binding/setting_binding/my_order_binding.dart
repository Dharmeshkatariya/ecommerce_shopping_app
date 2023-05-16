import 'package:furniture_shoping/controller/setting_controller/my_order_coontroller.dart';
import 'package:get/get.dart';

class MyOrderBindings extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<MyOrderController>(() => MyOrderController());
    // TODO: implement dependencies

  }

}
