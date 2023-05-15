import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/cart_entity.dart';

class MYCartScreenController extends GetxController {
  RxList<Cart> cartList = <Cart>[].obs;
  RxDouble total = 0.0.obs;

  updateQty(bool isAdd, int productQty) {

    if (isAdd) {
      productQty++;
      print(productQty);
    } else {
      if (productQty > 1) {
        productQty--;
        print(productQty);
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    cartList.value = await Common().getAllCard();
    getTotal();
  }

  deleteCartItem(int index) async {
    Common().deleteCartItem(cartList[index].id);
    cartList.value = await Common().getAllCard();
    getTotal();
  }

  getTotal() {
    total.value = 0.0;
    for (int a = 0; a < cartList.length; a++) {
      total.value += (cartList[a].cartProductPrice * cartList[a].cartProductOty);
    }
    update();
  }
}
