import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/setting_controller/shipping_address_controller.dart';
import 'package:furniture_shoping/modal/entity/address_entity.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class ShippingAddressScreen extends GetView<ShippingAddressController> {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProductData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {
            Get.toNamed(NameRoutes.addShippingAddressScreen);
          },
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_rounded),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Shipping address",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: controller.addressList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _addressListView(index);
                      }),
                ),
              ],
            ),
          )),
    );
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
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Divider(
              height: 30,
            ),
            Text(
              "${address.address},${address.zipcode},${address.country},${address.city},",
              style: GoogleFontsStyle.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              "Bruno Fernandes",
              style: GoogleFontsStyle.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Divider(
              height: 30,
            ),
            Text(
              "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
              style: GoogleFontsStyle.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
