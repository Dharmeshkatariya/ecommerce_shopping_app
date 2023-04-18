import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
import 'package:furniture_shoping/modal/entity/product_entity.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';

class ProductDetailScreenController extends GetxController {
  RxInt productQty = 1.obs;
  RxList<Product> productList = <Product>[].obs;

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
      Product product = Product(productData!.id, productData!.productName,
          productData!.image, productData!.productPrice, productQty.value);
      await Common().insertData(product);

      Get.toNamed(NameRoutes.myCartScreen);
      print(product);
    } catch (e) {
      print(e);
    }
  }

  getProductData() async {
    productList.value = await Common().getAllData();
  }
}
