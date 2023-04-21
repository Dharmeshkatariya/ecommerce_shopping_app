import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Check Out",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _commonRow("Shipping address"),
            _commonRow("Payment"),
            commonCard(text: "*******5252", svg: "assets/icon/mastercard.svg"),
            _commonRow("Delivery method"),
            commonCard(text: "2 days", svg: "assets/icon/dhl.svg"),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    _textRow(ordername: "Order", price: "20"),
                    const SizedBox(
                      height: 10,
                    ),
                    _textRow(ordername: "delivery", price: "20"),
                    const SizedBox(
                      height: 10,
                    ),
                    _textRow(ordername: "total", price: "20"),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Common.button(
                text: "Submit order",
                onTap: () {
                  Get.toNamed(NameRoutes.succeessOrderScreen);
                }),
          ],
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
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        Text(
          price!,
          style: GoogleFontsStyle.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }

  Widget _commonRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFontsStyle.poppins(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.grey),
        ),
        const Icon(Icons.edit),
      ],
    );
  }
}
