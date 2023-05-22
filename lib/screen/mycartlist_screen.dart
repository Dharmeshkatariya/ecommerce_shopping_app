import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/mycartscreen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:get/get.dart';

import '../modal/entity/cart_entity.dart';

class MyCartListScreen extends GetView<MYCartScreenController> {

  const MyCartListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.getProductData();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColor.black,
          ),
          centerTitle: true,
          backgroundColor: AppColor.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
          title:  Text(
            "myCart".tr,
            style: const TextStyle(color: AppColor.black),
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
                    children: [
                       Text("total".tr,style: TextStyle(color: AppColor.grey),),
                      Text(controller.total.toString(),style: TextStyle(color: AppColor.black),),
                    ],
                  ),
                  Common.button(
                      text: "checkOut".tr,
                      onTap: () {
                        Get.toNamed(NameRoutes.checkoutScreen, arguments: {
                          "total": controller.total,
                        });
                      })
                ],
              ),
            )));
  }

  Widget _cartListview(int index) {
    Cart cart = controller.cartList[index];
    return Container(
      width: double.infinity,

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
                      style: const TextStyle(fontSize: 14, color: AppColor.grey),
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
                Text("Rs ${cart.cartProductPrice}",style: TextStyle(color: AppColor.black),),
                const SizedBox(
                  height: 10,
                ), Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.selectedItem(index, true, cart.cartProductOty);
                      },
                      child: Container(decoration: BoxDecoration(color: AppColor.addIconWhite, borderRadius: BorderRadius.circular(5)), child: const Icon(Icons.add,color: AppColor.black,),
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
                        controller.selectedItem(index, false, cart.cartProductOty);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.addIconWhite,
                              borderRadius: BorderRadius.circular(6)),
                          child: const Icon(Icons.remove,color: AppColor.black,)),
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
