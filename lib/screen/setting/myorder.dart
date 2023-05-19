import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/setting_controller/my_order_coontroller.dart';
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
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "myOrder".tr,
            style: GoogleFontsStyle.poppins(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
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
      children:  [
        Text("orderNo".tr),
        Text("date".tr),
      ],
    );
  }

  Widget _detailRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _detailButton(),
         Text("cancel".tr),
      ],
    );
  }

  Widget _qtyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         "${"quantity".tr}: ${controller.qty.value}",
          style: GoogleFontsStyle.poppins(fontWeight: FontWeight.w600),
        ),
        Text(
          "${"totalAmount".tr}: ${controller.qty.value}",
          style: GoogleFontsStyle.poppins(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _detailButton({GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Text(
          "detail".tr,
          style: GoogleFontsStyle.poppins(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
