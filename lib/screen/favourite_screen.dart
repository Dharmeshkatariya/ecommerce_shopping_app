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
        body: Obx(
          () => Container(
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

              }),
            ]),
          ),
        ));
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
                          controller.deleteProduct(index);
                        },
                        child: SvgPicture.asset("assets/icon/close.svg")),
                  ],
                ),
                // Checkbox(
                //
                //     value: controller.checkBoxValue.value,
                //     onChanged: (value) {
                //
                //       value = controller.checkBoxValue.value;
                //     }),
                const SizedBox(
                  height: 8,
                ),
                Text(product.productPrice.toString()),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Spacer(),
                    const Icon(Icons.shopping_cart),
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
