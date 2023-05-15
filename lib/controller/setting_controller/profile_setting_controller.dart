import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettingController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();

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
}
