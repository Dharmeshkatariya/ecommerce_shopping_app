import 'package:furniture_shoping/controller/review_controller.dart';
import 'package:get/get.dart';

class RatingReviewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RatingReviewController());
    // TODO: implement dependencies
  }

}