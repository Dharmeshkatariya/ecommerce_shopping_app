import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/checkoutscreen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class CheckOutScreen extends GetView<CheckOutScreenController> {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    controller.getData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.black),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left)),
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          "checkOut".tr,
          style: const TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _commonRow(
                  text: "shipAddress".tr,
                  onPressed: () {
                    Get.toNamed(NameRoutes.shippingAddressScreen);
                  }),
              _commonRow(text: "payment".tr),
              commonCard(
                  text: "*******5252", svg: "assets/icon/mastercard.svg"),
              _commonRow(text: "deliveryMethod".tr),
              commonCard(text: "2day".tr, svg: "assets/icon/dhl.svg"),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      _textRow(
                          ordername: "order".tr, price: "${controller.total}"),
                      const SizedBox(
                        height: 10,
                      ),
                      _textRow(ordername: "delivery".tr, price: "5"),
                      const SizedBox(
                        height: 10,
                      ),
                      _textRow(
                          ordername: "total".tr.toLowerCase(),
                          price: "${controller.totalPrice.value}"),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Common.button(
                  text: "submitOrder".tr,
                  onTap: () {
                    controller.sendlaunchWhatsAppUri();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonCard({required String text, required String svg}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [SvgPicture.asset(svg), Text(text)],
        ),
      ),
    );
  }

  Widget _textRow({required String ordername, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ordername,
          style: GoogleFontsStyle.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: AppColor.grey),
        ),
        Text(
          price!,
          style: GoogleFontsStyle.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: AppColor.black),
        ),
      ],
    );
  }

  Widget _commonRow({required String text, VoidCallback? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFontsStyle.poppins(
              fontWeight: FontWeight.w600, fontSize: 18, color: AppColor.grey),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.edit),
        )
      ],
    );
  }
}
