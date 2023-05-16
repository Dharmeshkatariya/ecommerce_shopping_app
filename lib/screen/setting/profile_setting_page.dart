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
            onTap: (){
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _editRow("Personal information"),
              _cardInput(
                  laleltext: "Name", controller: controller.nameController),
              _cardInput(
                  laleltext: "Email", controller: controller.emailController),
              _editRow("Password"),
              _cardInput(
                  laleltext: "password", controller: controller.passController),
              _greyText(title: "Help Center", color: Colors.grey),
              _cardData(label: "FAQ"),
              _cardData(label: "Contact Us"),
              _cardData(label: "Privacy & Terms"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardData({required String label}) {
    return Card(
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
