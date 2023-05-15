import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/profilescreen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: Icon(Icons.keyboard_arrow_left),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
              () =>
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: controller.imagePath.isEmpty
                                      ? Image.asset(
                                    "assets/image/userprofile.png",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.file(
                                    File(
                                      controller.imagePath.value,
                                    ),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )),
                              Positioned(
                                  right: 12,
                                  bottom: 10,
                                  child: GestureDetector(
                                      onTap: () {
                                        controller.getImageGallery();
                                      },
                                      child: const Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 25,
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.username,
                                style: GoogleFontsStyle.inter(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Text(
                                controller.email,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .labelSmall,
                                softWrap: false,
                              ),
                            ],
                          )
                        ],
                      ),
                      _commonCard(
                          onTap: () {
                            Get.toNamed(NameRoutes.myOrderScreen);
                          },
                          title: "My orders",
                          desc: "Already have 10 orders"),
                      _commonCard(
                          onTap: () {
                            Get.toNamed(NameRoutes.shippingAddressScreen);
                          },
                          title: " Shipping Addresses",
                          desc: "03 Addresses"),
                      _commonCard(
                          title: "Payment Method",
                          desc: "You have 2 cards",
                          onTap: () {
                            Get.toNamed(NameRoutes.paymentMethodScreen);
                          }),
                      _commonCard(
                          title: "My  reviews", desc: "Reviews for 5 items"),
                      _commonCard(
                          onTap: () {
                            Get.toNamed(NameRoutes.profileSettingScreen);
                          },
                          title: "Setting",
                          desc: "Notification, Password, FAQ, Contact"),
                    ],
                  ),
                ),
              ),
        ));
  }

  Widget _commonCard({required String title,
    required String desc,
    GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFontsStyle.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        desc,
                        style: GoogleFontsStyle.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
