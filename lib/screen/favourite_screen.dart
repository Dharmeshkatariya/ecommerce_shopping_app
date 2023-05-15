import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/favoutire_controller.dart';
import 'package:get/get.dart';

import '../modal/entity/product_entity.dart';

class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.itemList.clear();
    controller.getProductData();
    controller.getProductCartData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Favoutires",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
      ),
      body: controller.obx(
        (state) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            Expanded(
              child: ListView.separated(
                itemCount: controller.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _favList(index);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
            Common.button(text: "Add all to my cart", onTap: () {

              controller.addToCartAllProduct();
            }),
          ]),
        ),
      ),
    );
  }

  Widget _favList(int index) {
    Product product = controller.productList[index];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              product.productImage,
              height: 100,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      softWrap: true,
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.deleteProduct(product);
                        },
                        child: SvgPicture.asset("assets/icon/close.svg")),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(product.productPrice.toString()),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const Icon(Icons.shopping_cart),
                    Checkbox(
                      checkColor: Colors.white,
                      value: product.isSelect,
                      onChanged: (bool? value) {
                        controller.selectedIndex(index, value);
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
