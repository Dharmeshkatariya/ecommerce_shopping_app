import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/signup_screen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form2 = GlobalKey<FormState>();
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Common.headerRow(),
                        Text(
                          "welcome".tr,
                          textAlign: TextAlign.center,
                          style: GoogleFontsStyle.poppins(
                              color: AppColor.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 30),
                            child: Form(
                              key: form2,
                              child: Column(
                                children: [
                                  Common.textFormFiled(
                                    validator: (value) {
                                      if (controller
                                          .nameController.text.isEmpty) {
                                        return 'name is required';
                                      }
                                    },
                                    controller: controller.nameController,
                                    labeltext: "name".tr,
                                    preicon: const Icon(Icons.person),
                                  ),
                                  _commonPadding(),
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
                                  Common.textFormFiled(
                                    validator: (value) {
                                      if (value.length != 10) {
                                        return 'mobile number is incorrect';
                                      }
                                    },
                                    controller: controller.mobileController,
                                    labeltext: "mobile".tr,
                                    preicon: const Icon(Icons.call),
                                  ),
                                  _commonPadding(),
                                  Common.authTextFormFiled(
                                    obsecuretext: controller.obsecuretext.value,
                                    validator: (value) {
                                      if (controller
                                          .passController.text.isEmpty) {
                                        return 'password is required';
                                      }
                                      return null;
                                    },
                                    controller: controller.passController,
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
                                  Common.authTextFormFiled(
                                    obsecuretext:
                                        controller.obsecuretext2.value,
                                    validator: (value) {
                                      if (controller
                                              .confirmPassController.text !=
                                          controller.passController.text) {
                                        return 'Confirm password are incorrect';
                                      }
                                    },
                                    controller:
                                        controller.confirmPassController,
                                    labeltext: "confirmPassword".tr,
                                    preicon: const Icon(Icons.lock),
                                    suficon: IconButton(
                                        onPressed: () {
                                          controller.obsecuretext2.value =
                                              !controller.obsecuretext2.value;
                                        },
                                        icon: Icon(
                                            controller.obsecuretext2.value
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility)),
                                  ),
                                  _commonPadding(),
                                  Common.button(
                                      text: "signUp".tr,
                                      onTap: () {
                                        if (form2.currentState!.validate()) {
                                          controller.signUpUserApi();
                                        }
                                      }),
                                  _commonPadding(),
                                  _alreadyAccountRow(),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _commonPadding() {
    return const Padding(padding: EdgeInsets.symmetric(vertical: 6));
  }

  Widget _alreadyAccountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _text(text: "alreadyAccount".tr, color: AppColor.grey),
        _text(
            text: "signIn".tr,
            color: AppColor.black,
            onTap: () {
              Get.toNamed(NameRoutes.loginScreen);
            }),
      ],
    );
  }

  Widget _text(
      {required String text, GestureTapCallback? onTap, Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFontsStyle.inter(
            fontWeight: FontWeight.w400, fontSize: 16, color: color),
      ),
    );
  }
}
