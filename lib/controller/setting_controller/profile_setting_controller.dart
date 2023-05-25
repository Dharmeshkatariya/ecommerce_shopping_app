import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/firebase_service/firebase_services.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettingController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();


  final passController = TextEditingController();

  RxString gender = "".obs;
  RxBool isDarkMode = false.obs;

  changeTheme() {

    isDarkMode.value = !isDarkMode.value;

    isDarkMode.value ? Get.changeTheme(ThemeData.dark()) : Get.changeTheme(ThemeData.light());

  }

  setData(value) {
    gender.value = value.toString();

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUserData();

    super.onInit();
  }

  getUserData() async {

    var shareP = await SharedPreferences.getInstance();

    emailController.text = shareP.getString("email") ?? "";
    nameController.text = shareP.getString("username") ?? "";
    passController.text = shareP.getString("pass") ?? "";
  }

  logout() async {
    AuthMethod().googleSignOut();
    var shareP = await SharedPreferences.getInstance();

    shareP.remove("login");
    Get.offNamed(NameRoutes.loginScreen);
  }
}
