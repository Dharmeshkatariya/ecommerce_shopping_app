import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/product_detail_screen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends GetView<ProductDetailScreenController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getFavData();
    return Scaffold(
        body: Obx(() => SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _stackImage(),
                      _text(
                          text: controller.productData!.categoryName,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey,
                          fontSize: 24),
                      _qtyRow(),
                      _reviewRow(),
                      _text(
                          text: controller.productData!.description,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColor.grey),
                      _bottomRow()
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _qtyRow() {
    return Row(
      children: [
        _text(
            text: "Rs ${controller.productData!.productPrice}",
            fontWeight: FontWeight.w600,
            color: AppColor.black,
            fontSize: 32),
        const Spacer(),
        GestureDetector(
            onTap: () {
              controller.updateQty(true);
            },
            child: const Icon(Icons.add,color: AppColor.black,)),
        const SizedBox(
          width: 20,
        ),
        Text("${controller.productQty.value}",style: TextStyle(color: AppColor.black),),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              controller.updateQty(false);
            },
            child: SvgPicture.asset("assets/icon/minus.svg",color: AppColor.black)),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget _reviewRow() {
    return GestureDetector(
      onTap: (){
        Get.toNamed(NameRoutes.ratingReviewScreen);
      },
      child: Row(
        children: [
          SvgPicture.asset("assets/icon/star.svg"),
          const SizedBox(
            width: 10,
          ),
          _text(text: "${controller.productData!.totalRateValue}"),
          const SizedBox(
            width: 10,
          ),
          _text(text: "(${controller.productData!.totalReview} Review)"),
        ],
      ),
    );
  }

  Widget _text(
      {required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      text,
      style: GoogleFontsStyle.poppins(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }

  Widget _stackImage() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(40)),
            child: Image.network(
              controller.productData!.image,
              fit: BoxFit.fill,
              height: 450,
              width: double.infinity,
            ),
          ),
        ),
        Positioned(
            top: 20,
            left: 30,
            child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: const Icon(Icons.chevron_left)))),
        Positioned(
            top: 100,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColor.white, borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                "assets/image/framecircle.png",
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            )),
      ],
    );
  }

  Widget _bottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            controller.addToFavourite();
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              decoration: BoxDecoration(
                  color: controller.isDisable.value?
                  AppColor.grey  : AppColor.green , borderRadius: BorderRadius.circular(12)),
              child: Image.asset(
                "assets/image/save.png",
                color: AppColor.white,
              )),
        ),
        Common.button(
            text: "addToCart".tr,
            onTap: () {
              controller.addToCart();
            },
            width: 240),
      ],
    );
  }
}
