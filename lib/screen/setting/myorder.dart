import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/setting_controller/my_order_coontroller.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyOrderScreen extends GetView<MyOrderController> {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_rounded)),
          iconTheme: const IconThemeData(color: AppColor.black),
          backgroundColor: AppColor.white,
          centerTitle: true,
          title: Text(
            "myOrder".tr,
            style: GoogleFontsStyle.poppins(
                color: AppColor.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        body: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        _orderNumberRow(),
                        const SizedBox(
                          height: 10,
                        ),
                        _qtyRow(),
                        const SizedBox(
                          height: 25,
                        ),
                        _detailRow(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _orderNumberRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("orderNo".tr,style: const TextStyle(color: AppColor.black),),
        Text("date".tr,style: const TextStyle(color: AppColor.black),),
      ],
    );
  }

  Widget _detailRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Common.smallButton(text: "detail".tr, onTap: () {}),
        Text("cancel".tr,style: TextStyle(color: AppColor.white),),
      ],
    );
  }

  Widget _qtyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${"quantity".tr}: ${controller.qty.value}",
          style: GoogleFontsStyle.poppins(fontWeight: FontWeight.w600,color: AppColor.black),
        ),
        Text(
          "${"totalAmount".tr}: ${controller.qty.value}",
          style: GoogleFontsStyle.poppins(fontWeight: FontWeight.w600,color: AppColor.black),
        ),
      ],
    );
  }
}
