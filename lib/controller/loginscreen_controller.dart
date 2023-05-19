import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/rest_client.dart';
import '../routes/nameroutes.dart';

class LogInScreenController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool obsecuretext = true.obs;

  RxBool connecteSattus = false.obs;

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivytsubscription;

  @override
  void onInit() {
    super.onInit();
    intConnectivity();
    connectivytsubscription = connectivity.onConnectivityChanged.listen(updateConnection);
  }

  Future<void> intConnectivity() async {
    ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
      return updateConnection(result);
    } catch (e) {
      print(e);
    }
  }


  updateConnection(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      connecteSattus.value = true;
    } else if (result == ConnectivityResult.mobile) {
      connecteSattus.value = true;
    } else if (result == ConnectivityResult.none) {
      connecteSattus.value = false;
    } else {
      Get.snackbar('network error', "field");
    }
  }

  final _restClient = RestClient();

  loginUserApi() async {
    try {
      isLoading.value = true;
      Map<String, dynamic> data = {
        "email": emailController.text.trim(),
        "password": passController.text.trim(),
      };
      var response = await _restClient.post(path: "/${"login"}", data: data);
      if (response.statusCode == 200) {
        isLoading.value = false;
        var shareP = await SharedPreferences.getInstance();
        shareP.setBool("login", true);
        shareP.setString("email", emailController.text.trim());
        shareP.setString("password", passController.text.trim());
        Get.toNamed(NameRoutes.dashBoardScreen);
        Get.snackbar("login", "success");
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar("field", "$e");
    }
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    connectivytsubscription.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}
