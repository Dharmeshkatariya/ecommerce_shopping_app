import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
import 'package:furniture_shoping/modal/product_entity.dart';
import 'package:get/get.dart';

class ProductDetailScreenController extends GetxController {
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
    getData();
    super.onInit();
  }

  ProductData? productData;

  getData() {
    if (Get.arguments != null) {
      productData = Get.arguments["productData"];
    }
  }

  addToCart() async {
    try {
      Product product = Product(
        Common().getRandomId(),
        productData!.productName,
        productData!.image,
        productData!.productPrice,
        productQty.value

      );
      await Common().insertData(product);
      print(product);
    } catch (e) {
      print(e);
    }
  }
}
