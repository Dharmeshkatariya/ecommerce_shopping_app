import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: Column(

          children: [
            Row(
              children: [
                Image.network(controller.productData!.image)
              ],
            )

          ],
        ),
      ),
    );
  }
}
