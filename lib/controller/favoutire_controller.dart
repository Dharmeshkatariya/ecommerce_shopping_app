import 'package:furniture_shoping/controller/mycartscreen_controller.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/cart_entity.dart';
import '../modal/entity/product_entity.dart';
import '../routes/nameroutes.dart';

class FavouriteController extends GetxController
   {
  RxList<Product> productList = <Product>[].obs;
  RxBool isChecked = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    productList.clear();
    productList.value = await Common().getAllData();
    update();

  }

  deleteProduct(int index) async {
    Common().deleteProduct(productList[index].id);
    productList.value = await Common().getAllData();
    update();

  }



  addToCartAllProduct(int index) async {
    try {
      Cart cart = Cart(
          productList[index].id,
          productList[index].productName,
          productList[index].productPrice,
          productList[index].productImage,
          productList[index].productQty);
      await Common().insertCard(cart);

      Get.toNamed(NameRoutes.myCartScreen);
      print(cart);
    } catch (e) {
      print(e);
    }
  }
}
