import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/setting_controller/shipping_address_controller.dart';
import 'package:furniture_shoping/modal/entity/address_entity.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class ShippingAddressScreen extends GetView<ShippingAddressController> {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProductData();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.white,
          child: IconButton(
            onPressed: () {
              Get.toNamed(NameRoutes.addShippingAddressScreen);
            },
            icon: const Icon(
              Icons.add,
              color: AppColor.black,
            ),
          ),
          onPressed: () {},
        ),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_rounded)),
          backgroundColor: AppColor.white,
          iconTheme: const IconThemeData(color: AppColor.black),
          centerTitle: true,
          title: Text(
            "shipAddress".tr,
            style: const TextStyle(color: AppColor.black),
          ),
        ),
        body: controller.obx(
            (state) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: controller.addressList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _addressListView(index);
                            }),
                      ),
                    ],
                  ),
                ),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            )));
  }

  Widget _addressListView(int index) {
    Address address = controller.addressList[index];
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              address.name,
              style: GoogleFontsStyle.poppins(
                  color: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const Divider(
              height: 30,
            ),
            Text(
              "${address.address},${address.zipcode},${address.country},${address.city},",
              style: GoogleFontsStyle.poppins(
                color: AppColor.black,
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
