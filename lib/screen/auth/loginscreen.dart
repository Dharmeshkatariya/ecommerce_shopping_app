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
                        "Hello! \nWELCOME BACK",
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
                            key: controller.form,
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
                                  labeltext: "Email",
                                  preicon: const Icon(Icons.email_outlined),
                                ),
                                _commonPadding(),
                                Common.textFormFiled(
                                    validator: (value) {
                                      if (controller
                                          .passController.text.isEmpty) {
                                        return 'password is required';
                                      }
                                    },
                                    controller: controller.passController,
                                    labeltext: "Password",
                                    preicon: const Icon(Icons.lock),
                                    suficon: const Icon(Icons.visibility)),
                                _commonPadding(),
                                _text(text: "Forgot Password"),
                                _commonPadding(),
                                Common.button(
                                    text: "Log In",
                                    onTap: () {
                                      if (controller.form.currentState!
                                          .validate()) {
                                        controller.loginUserApi();


                                      }
                                    }),
                                _commonPadding(),
                                _text(
                                    text: "Sign up",
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
