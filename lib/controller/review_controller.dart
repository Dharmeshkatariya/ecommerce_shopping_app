import 'package:get/get.dart';

import '../modal/homescreen_modal/peroduct_modal.dart';

class RatingReviewController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  ProductData? productData;

  getData() {
    if (Get.arguments != null) {
      productData = Get.arguments["productData"];
    }
  }
}
