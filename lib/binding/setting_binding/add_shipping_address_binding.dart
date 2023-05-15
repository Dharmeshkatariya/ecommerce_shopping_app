import 'package:furniture_shoping/controller/setting_controller/add_shipping_addrss_controller.dart';
import 'package:get/get.dart';

class AddShippingAddressBinding extends Bindings {

  @override

  void dependencies() {

    Get.lazyPut<AddShippingAddressController>(() => AddShippingAddressController());

  }
}
