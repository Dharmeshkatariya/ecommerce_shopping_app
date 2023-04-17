import 'package:furniture_shoping/controller/product_detail_screen_controller.dart';
import 'package:get/get.dart';

class ProductDetailScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductDetailScreenController());
    // TODO: implement dependencies
  }

}