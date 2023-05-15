import 'package:furniture_shoping/modal/entity/address_entity.dart';
import 'package:get/get.dart';

import '../../common.dart';

class ShippingAddressController extends GetxController {
  RxList addressList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    addressList.value = await Common().getAllAddress();
    update();
  }
}
