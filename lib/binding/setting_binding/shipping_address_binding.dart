import 'package:furniture_shoping/controller/setting_controller/shipping_address_controller.dart';
import 'package:get/get.dart';

class ShippingAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShippingAddressController>(() => ShippingAddressController());
    // TODO: implement dependencies
  }
}
