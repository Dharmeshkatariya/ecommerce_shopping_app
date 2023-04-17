import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
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
                Text("minimal"),
                Row(
                  children: [
                    Text("price"),
                    GestureDetector(onTap: () {}, child: const Icon(Icons.add)),
                    Text("qty"),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset("assets/icon/minus.svg")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(12)),
            child: Image.asset("assets/image/save.png")),
        Common.button(text: "Add to Cart", onTap: () {}),
      ],
    );
  }
}
