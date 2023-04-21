import 'package:get/get.dart';

class CheckOutScreenController extends GetxController {
  late RxDouble total;

  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    getData();
    getTotalPrice();
    // TODO: implement onInit
    super.onInit();
  }

  getData() {
    if (Get.arguments != null) {
      total = Get.arguments["total"];
      print(total);
    }
  }

  getTotalPrice() {
    totalPrice.value = total.value + 5;
    print(totalPrice);
  }
}
