import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay/pay.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PaymentItem> payitem = [];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.white,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: AppColor.black,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "paymentMethod".tr,
          style: const TextStyle(color: AppColor.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left)),
        iconTheme: const IconThemeData(color: AppColor.black),
        backgroundColor: AppColor.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: AppColor.black,
              borderOnForeground: true,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/master.svg",
                        height: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('**** **** **** 1548',
                          textAlign: TextAlign.center,
                          style: GoogleFontsStyle.inter(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20)),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "card user bname",
                            style: TextStyle(color: AppColor.white),
                          ),
                          Text(
                            "Expiry date",
                            style: TextStyle(color: AppColor.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "user bname",
                            style: TextStyle(color: AppColor.white),
                          ),
                          Text(
                            "20/25",
                            style: TextStyle(color: AppColor.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GooglePayButton(
              onPressed: () {},
              type: GooglePayButtonType.buy,
              paymentConfigurationAsset: "gpay.json",
              onPaymentResult: googlePayResult,
              paymentItems: payitem,
            ),
          ],
        ),
      ),
    );
  }

  googlePayResult(res) {}
}
