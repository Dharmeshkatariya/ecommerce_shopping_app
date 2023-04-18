import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/cart_entity.dart';

class MYCartScreenController extends GetxController {
  RxList<Cart> cartList = <Cart>[].obs;

  RxInt productQty = 1.obs;

  updateQty(bool isAdd) {
    if (isAdd) {
      productQty.value++;
    } else {
      if (productQty.value > 1) {
        productQty.value--;
      }
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    cartList.value = await Common().getAllCard();
  }

  deleteCartItem(int index) async {
    Common().deleteCartItem(cartList[index].id);
    cartList.value = await Common().getAllCard();
  }
}
