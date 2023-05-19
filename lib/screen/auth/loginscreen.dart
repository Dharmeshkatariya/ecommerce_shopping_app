import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

import '../../controller/loginscreen_controller.dart';

class LogInScreen extends GetView<LogInScreenController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Common.headerRow(),
                      Text(
                        "welcomeBack".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFontsStyle.poppins(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      _commonPadding(),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Form(
                            key: form,
                            child: Column(
                              children: [
                                Common.textFormFiled(
                                  validator: (value) {
                                    if (controller
                                        .emailController.text.isEmpty) {
                                      return 'email is required';
                                    }
                                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(
                                        controller.emailController.text)) {
                                      return "Please enter a valid email address";
                                    }
                                  },
                                  controller: controller.emailController,
                                  labeltext: "email".tr,
                                  preicon: const Icon(Icons.email_outlined),
                                ),
                                _commonPadding(),
                                Common.authTextFormFiled(
                                  obsecuretext: controller.obsecuretext.value,
                                  controller: controller.passController,
                                  validator: (value) {
                                    if (controller
                                        .passController.text.isEmpty) {
                                      return 'password is required';
                                    }
                                  },
                                  labeltext: "password".tr,
                                  preicon: const Icon(Icons.lock),
                                  suficon: IconButton(
                                      onPressed: () {
                                        controller.obsecuretext.value =
                                            !controller.obsecuretext.value;
                                      },
                                      icon: Icon(controller.obsecuretext.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility)),
                                ),
                                _commonPadding(),
                                _text(text: "forgetPassword".tr),
                                _commonPadding(),
                                Common.button(
                                    text: "login".tr,
                                    onTap: () {
                                      if (form.currentState!.validate()) {
                                        controller.loginUserApi();
                                      }
                                    }),
                                _commonPadding(),
                                _text(
                                    text: "signUp".tr,
                                    onTap: () {
                                      Get.toNamed(NameRoutes.signUpScreen);
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }

  Widget _commonPadding() {
    return const Padding(padding: EdgeInsets.symmetric(vertical: 10));
  }

  Widget _text({required String text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style:
            GoogleFontsStyle.inter(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }
}
