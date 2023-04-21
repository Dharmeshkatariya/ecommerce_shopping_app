import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/review_controller.dart';
import 'package:get/get.dart';

class RatingReviewScreen extends GetView<RatingReviewController> {
  const RatingReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Rating & Review",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(

          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                    child: Image.network(controller.productData!.image,height: 100,)),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.productData!.productName),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                     Row(
                       children: [
                         SvgPicture.asset("assets/icon/star.svg"),
                         const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                         Text(controller.productData!.totalRateValue.toString()),
                       ],
                     ),
                      const  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Text("${controller.productData!.totalRateValue} review"),
                    ],
                  ),
                )
              ],
            ),
            Common.button(text: "Write a review")

          ],
        ),
      ),
    );
  }
}
