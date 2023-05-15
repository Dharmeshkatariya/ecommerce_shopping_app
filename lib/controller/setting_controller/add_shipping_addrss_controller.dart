import 'package:flutter/cupertino.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/modal/entity/address_entity.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';

class AddShippingAddressController extends GetxController {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final zipcodeController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();

  saveToAddress() async {
    try {
      Address address = Address(
          Common().getRandomId(),
          nameController.text,
          addressController.text,
          int.parse(zipcodeController.text),
          countryController.text,
          cityController.text,
          districtController.text);
      await Common().insertAddress(address);
      await Common.commonSnabar("Address ", "address succefully added");
      Get.toNamed(NameRoutes.shippingAddressScreen);

      print(address);
    } catch (e) {
      print(e);
    }
  }
}
