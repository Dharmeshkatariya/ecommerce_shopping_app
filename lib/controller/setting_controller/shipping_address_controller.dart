import 'package:furniture_shoping/modal/entity/address_entity.dart';
import 'package:get/get.dart';

import '../../common.dart';

class ShippingAddressController extends GetxController with StateMixin<  List<Address> > {
  List<Address> addressList = <Address>[];
  List<Address> itemList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    addressList = await Common().getAllAddress();
    update();
    change(addressList,status: RxStatus.success());
  }


}
