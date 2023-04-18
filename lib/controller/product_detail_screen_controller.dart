import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/favoutire_controller.dart';
import 'package:furniture_shoping/modal/entity/cart_entity.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
import 'package:furniture_shoping/modal/entity/product_entity.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';

class ProductDetailScreenController extends GetxController {
  RxInt productQty = 1.obs;
  late int selectedProductIndex   ;

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
    getData();
    super.onInit();
  }

  ProductData? productData;

  getData() {
    if (Get.arguments != null) {
      productData = Get.arguments["productData"];
      selectedProductIndex = Get.arguments["index"];
    }
  }


  addToCart() async {
    try {
      Cart cart = Cart(productData!.id, productData!.productName,
          productData!.productPrice, productData!.image, productQty.value);
      await Common().insertCard(cart);

      Get.toNamed(NameRoutes.myCartScreen);
      print(cart);
    } catch (e) {
      print(e);
    }
  }

  addToFavourite() async {
    try {
  /*    FavouriteController favouriteController = Get.find();
      // var id = favouriteController.productList[selectedProductIndex].id;
      if (id != productData!.id) {

      }*/
      var data = await Common().getProductById(productData!.id);
      print(data);


      Product product = Product(productData!.id, productData!.productName,
          productData!.image, productData!.productPrice, productQty.value);
      await Common().insertData(product);
      Get.toNamed(NameRoutes.favouriteScreen);
    } catch (e) {
      print(e);
    }
  }
}
