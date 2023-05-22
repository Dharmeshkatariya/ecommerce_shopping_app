import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/setting_controller/add_shipping_addrss_controller.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:get/get.dart';

class AddShippingAddress extends GetView<AddShippingAddressController> {
  const AddShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading:
            GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_rounded),
            ),
        iconTheme: const IconThemeData(color: AppColor.black),
        backgroundColor: AppColor.white,
        centerTitle: true,
        title:  Text(
          "addShipAddress".tr,
          style: const TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Common.textFormFiled(
                  labeltext: "name".tr,
                  controller: controller.nameController),
              _padding(),
              Common.textFormFiled(
                  labeltext: "address".tr,
                  controller: controller.addressController),
              _padding(),
              Common.textFormFiled(
                  labeltext: "code".tr,
                  controller: controller.zipcodeController),
              _padding(),
              Common.textFormFiled(
                  labeltext: "country".tr,
                  controller: controller.countryController),
              _padding(),
              Common.textFormFiled(
                  labeltext: "city".tr, controller: controller.cityController),
              _padding(),
              Common.textFormFiled(
                  labeltext: "district".tr,
                  controller: controller.districtController),
              _padding(),
              Common.button(
                  text: "saveAddress".tr,
                  onTap: () {
                    controller.saveToAddress();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _padding() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

}
