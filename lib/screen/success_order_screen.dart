import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "success".tr,
                      style: GoogleFontsStyle.poppins(
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 32),
                    ),
                    Image.asset("assets/image/orderdone.png"),
                    Text(
                      "orderComing".tr,
                      style: TextStyle(color: AppColor.black),
                    ),
                  ],
                ),
              ),
              Common.button(
                  text: "trackYourOrder".tr,
                  onTap: () {
                    Get.toNamed(NameRoutes.myOrderScreen);
                  }),
              Common.button(
                  text: "backHome".tr,
                  onTap: () {
                    Get.toNamed(NameRoutes.dashBoardScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
