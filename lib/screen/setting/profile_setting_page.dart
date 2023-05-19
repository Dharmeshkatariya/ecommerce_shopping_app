import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/setting_controller/profile_setting_controller.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class ProfileSettingScreen extends GetView<ProfileSettingController> {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.keyboard_arrow_left)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _editRow("personalInfo".tr),
                    _cardInput(
                        laleltext: "name".tr,
                        controller: controller.nameController),
                    _cardInput(
                        laleltext: "email".tr,
                        controller: controller.emailController),
                    _editRow("password".tr),
                    _cardInput(
                        laleltext: "password".tr.toLowerCase(),
                        controller: controller.passController),
                    _greyText(title: "language".tr, color: Colors.grey),
                    _radioListTile(value: "English", onTap: () {




                    }),

                    _radioListTile(value: "Hindi", onTap: () {


                    }),

                    _radioListTile(value: "Gujarati", onTap: () {


                    }),

                    _greyText(title: "helpCenter".tr, color: Colors.grey),
                    _cardData(label: "fAQ".tr),
                    _cardData(label: "contactUs".tr),
                    _cardData(label: "privacy".tr),
                    _cardData(
                        label: "logOut".tr,
                        onTap: () {
                          controller.logout();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _radioListTile({required String value, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: RadioListTile(
          title: Text(value),
          value: value,
          groupValue: controller.gender.value,
          onChanged: (value) {
            controller.setData(value);
          }),
    );
  }

  Widget _cardData({required String label, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                label,
                style: GoogleFontsStyle.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16),
              )),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardInput(
      {required String laleltext, TextEditingController? controller}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Common.textFormFiled(labeltext: laleltext, controller: controller),
    );
  }

  Widget _editRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _greyText(title: title, color: Colors.grey),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget _greyText({required String title, Color? color}) {
    return Text(
      title,
      style: GoogleFontsStyle.poppins(
          color: color, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
