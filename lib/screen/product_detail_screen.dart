import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ProductData productData = Get.arguments["productData"];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _stackImage(),
                _text(
                    text: "minimal", fontWeight: FontWeight.w400, fontSize: 24),
                _qtyRow(),
                _reviewRow(),
                _text(
                    text:
                        "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey),
                _bottomRow()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _qtyRow() {
    return Row(
      children: [
        _text(text: "Rs 56", fontWeight: FontWeight.w600, fontSize: 32),
        Spacer(),
        GestureDetector(onTap: () {}, child: const Icon(Icons.add)),
        Text("qty"),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset("assets/icon/minus.svg")),
      ],
    );
  }

  Widget _reviewRow() {
    return Row(
      children: [
        SvgPicture.asset("assets/icon/star.svg"),
        SizedBox(
          width: 10,
        ),
        _text(text: "4.5"),
        SizedBox(
          width: 10,
        ),
        _text(text: "(50 review)"),
      ],
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
            child: Image.asset(
              "assets/image/splash.png",
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.chevron_left))),
        Positioned(
            top: 100,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
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
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            child: Image.asset(
              "assets/image/save.png",
              color: Colors.white,
            )),
        Common.button(text: "Add to Cart", onTap: () {}, width: 240),
      ],
    );
  }
}
