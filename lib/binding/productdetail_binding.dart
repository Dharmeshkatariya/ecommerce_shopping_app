import 'package:furniture_shoping/controller/product_detail_screen_controller.dart';
import 'package:furniture_shoping/controller/review_controller.dart';
import 'package:get/get.dart';

class ProductDetailScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductDetailScreenController());
    Get.put(RatingReviewController());
    // TODO: implement dependencies
  }

}