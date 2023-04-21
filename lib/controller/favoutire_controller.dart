import 'package:furniture_shoping/controller/mycartscreen_controller.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/cart_entity.dart';
import '../modal/entity/product_entity.dart';
import '../routes/nameroutes.dart';

class FavouriteController extends GetxController
    with StateMixin<List<Product>> {
  List<Product> productList = <Product>[];
  List<int> itemList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    change(productList, status: RxStatus.loading());
    getProductData();
    super.onInit();
  }

  getProductData() async {
    productList.clear();
    itemList.clear();
    productList = await Common().getAllData();
    change(productList, status: RxStatus.success());
  }

  deleteProduct(int index) async {
    Common().deleteProduct(productList[index].id);
    productList.removeAt(index);
    print(productList);

    update();
  }

  // allDeleteProduct(int index) async {
  //   Common().deleteProduct(productList[index].id);
  //   productList = await Common().getAllData();
  //   // productList.removeAt(index);
  //   update();
  // }

  addToCartAllProduct() async {
    try {
      for (int i = 0; i < itemList.length; i++) {
        Cart cart = Cart(
            productList[itemList[i]].id,
            productList[itemList[i]].productName,
            productList[itemList[i]].productPrice,
            productList[itemList[i]].productImage,
            productList[itemList[i]].productQty);
        await Common().insertCard(cart);
        deleteProduct(itemList[i]);
        print(productList.length);
      }

      print(productList);
      itemList.clear();

      change(productList, status: RxStatus.success());

      Get.toNamed(NameRoutes.myCartScreen);
    } catch (e) {
      print(e);
    }
  }

  selectedIndex(int index, value) {

    for (int i = 0; i < productList.length; i++) {
      if (i == index) {
        productList[index].isSelect = value;
        itemList.add(index);
      }
    }
    change(productList, status: RxStatus.success());
  }
}
