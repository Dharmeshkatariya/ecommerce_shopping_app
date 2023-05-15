import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/cart_entity.dart';
import '../modal/entity/product_entity.dart';
import '../routes/nameroutes.dart';

class FavouriteController extends GetxController
    with StateMixin<List<Product>> {
  List<Product> productList = <Product>[];
  List<Product> itemList = [];
  List<Cart> cartList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    change(productList, status: RxStatus.loading());
    getProductData();
    getProductCartData();
    super.onInit();
  }

  getProductData() async {
    productList.clear();
    itemList.clear();
    productList = await Common().getAllData();
    change(productList, status: RxStatus.success());
  }

  deleteProduct(Product product) async {
    await Common().deleteProduct(product.id);
    productList.remove(product);
    print(productList);
    update();
  }

  // allDeleteProduct(int index) async {
  //   Common().deleteProduct(productList[index].id);
  //   productList = await Common().getAllData();
  //   // productList.removeAt(index);
  //   update();
  // }
  getProductCartData() async {
    cartList = await Common().getAllCard();
  }

  addToCartAllProduct() async {
    getProductCartData();
    try {
      for (int i = 0; i < itemList.length; i++) {
        Cart cart = Cart(
          itemList[i].id,
          itemList[i].productName,
          itemList[i].productPrice,
          itemList[i].productImage,
          itemList[i].productQty,
        );
        if (cartList.isEmpty) {
          await Common().insertCard(cart);
          await deleteProduct(itemList[i]);
          Get.toNamed(NameRoutes.myCartScreen);
        } else if (cartList[i].id == itemList[i].id) {
          Common.commonSnabar("my cart", "already added this item");
        } else {
          await Common().insertCard(cart);
          await deleteProduct(itemList[i]);
          Get.toNamed(NameRoutes.myCartScreen);
        }
      }
      itemList.clear();
      change(productList, status: RxStatus.success());
    } catch (e) {
      print(e);
    }
  }

  selectedIndex(int index, value) {
    for (int i = 0; i < productList.length; i++) {
      if (i == index) {
        productList[index].isSelect = value;
        itemList.add(productList[index]);
      }
    }
    change(productList, status: RxStatus.success());
  }
}
