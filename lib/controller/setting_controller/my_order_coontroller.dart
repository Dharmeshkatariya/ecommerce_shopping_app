import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrderController extends GetxController {
  RxDouble qty = 0.0.obs;
  RxDouble total = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  getData() async {
    var shareP = await SharedPreferences.getInstance();
    qty.value += shareP.getDouble("qty") ?? 0.0;
    total.value += shareP.getDouble("total") ?? 0.0;
  }
}
