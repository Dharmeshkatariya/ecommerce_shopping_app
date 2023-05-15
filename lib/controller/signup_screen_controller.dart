import 'package:flutter/cupertino.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/rest_client.dart';

class SignUpScreenController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final mobileController = TextEditingController();
  final confirmPassController = TextEditingController();

  final form = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  final _restClient = RestClient();

  signUpUserApi() async {
    try {
      isLoading.value = true;
      Map<String, dynamic> data12 = {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "mobile": mobileController.text.trim(),
        "password": passController.text.trim(),
        "c_password": confirmPassController.text.trim(),
      };
      var response =
          await _restClient.post(path: "/${"register"}", data: data12);
      if (response.statusCode == 200) {
        Get.snackbar("success", "register");
        var shareP = await SharedPreferences.getInstance();
        shareP.setString("username", nameController.text);
        shareP.setString("email", emailController.text);
        shareP.setString("pass", passController.text);
        Get.toNamed(NameRoutes.loginScreen);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("field", "$e");
      print(e);
    }
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    mobileController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
