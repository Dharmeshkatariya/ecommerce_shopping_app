import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/controller/signup_screen_controller.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Common.headerRow(),
                        Text(
                          "WELCOME",
                          textAlign: TextAlign.center,
                          style: GoogleFontsStyle.poppins(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 30),
                            child: Form(
                              key: controller.form,
                              child: Column(
                                children: [
                                  Common.textFormFiled(
                                    validator: (value) {
                                      if (controller
                                          .nameController.text.isEmpty) {
                                        return 'email is required';
                                      }
                                    },
                                    controller: controller.nameController,
                                    labeltext: "Name",
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
                                    labeltext: "Email",
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
                                    labeltext: "mobile",
                                    preicon: const Icon(Icons.call),
                                  ),
                                  _commonPadding(),
                                  Common.textFormFiled(
                                      validator: (value) {
                                        if (controller
                                            .passController.text.isEmpty) {
                                          return 'password is required';
                                        }
                                        return null;
                                      },
                                      controller: controller.passController,
                                      labeltext: "Password",
                                      preicon: const Icon(Icons.lock),
                                      suficon: const Icon(Icons.visibility)),
                                  _commonPadding(),
                                  Common.textFormFiled(
                                      validator: (value) {
                                        if (controller
                                                .confirmPassController.text !=
                                            controller.passController.text) {
                                          return 'Confirm password are incorrect';
                                        }
                                      },
                                      controller:
                                          controller.confirmPassController,
                                      labeltext: "Confirm Password",
                                      preicon: const Icon(Icons.lock),
                                      suficon: const Icon(Icons.visibility)),
                                  _commonPadding(),
                                  Common.button(
                                      text: "Sign Up",
                                      onTap: () {
                                        if (controller.form.currentState!
                                            .validate()) {
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
        _text(text: "Already have account ? ", color: Colors.grey),
        _text(
            text: "Sign in",
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
