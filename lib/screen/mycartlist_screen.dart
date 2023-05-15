import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/mycartscreen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';

import '../modal/entity/cart_entity.dart';
import '../modal/entity/product_entity.dart';

class MyCartListScreen extends GetView<MYCartScreenController> {
  const MyCartListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        title: const Text(
          "my cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: controller.cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _cartListview(index);
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Total"),
                    Text(controller.total.toString()),
                  ],
                ),
                Common.button(text: "Check Out",onTap:(){

                  Get.toNamed(NameRoutes.checkoutScreen,arguments: {
                    "total":controller.total
                  });
                } )
              ],
            ),
          )),
    );
  }

  Widget _cartListview(int index) {
    Cart cart = controller.cartList[index];
    return Container(
      width: double.infinity,
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              cart.cartProductImage,
              fit: BoxFit.fitHeight,
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
                      cart.cartProductName,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.deleteCartItem(index);
                        },
                        child: SvgPicture.asset("assets/icon/close.svg")),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Rs ${cart.cartProductPrice}"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.updateQty(true,cart.cartProductOty);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(

                      "${cart.cartProductOty}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.updateQty(false,cart.cartProductOty);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(6)),
                        child: SvgPicture.asset(
                          "assets/icon/minus.svg",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
