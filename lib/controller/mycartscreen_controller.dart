import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common.dart';
import '../modal/entity/cart_entity.dart';

class MYCartScreenController extends GetxController {
  List<Cart> cartList = [];
  RxDouble total = 0.0.obs;
  RxDouble qty = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    cartList = await Common().getAllCard();
    getTotal();
  }

  deleteCartItem(int index) async {
    Common().deleteCartItem(cartList[index].id);
    cartList = await Common().getAllCard();
    getTotal();
  }

  getTotal() async{
    total.value = 0.0;
    qty.value = 0.0;
    for (int a = 0; a < cartList.length; a++) {
      total.value += (cartList[a].cartProductPrice * cartList[a].cartProductOty);
      qty.value += cartList[a].cartProductOty;
    }
    var shareP = await SharedPreferences.getInstance();
    shareP.setDouble("qty", qty.value);
    shareP.setDouble("total", total.value);

  }

  selectedItem(int index, bool isAdd, int cartProductQty) async {
    int qty = isAdd ? cartList[index].cartProductOty + 1 : cartList[index].cartProductOty - 1;
    cartList[index].cartProductOty = qty;
    updateCartItem(index, cartProductQty);
    getTotal();
  }

  updateCartItem(int index, int cartProductOty) async {
    Common().updateCart(cartProductOty, cartList[index].id);
    update();
  }
}
