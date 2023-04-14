import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

import '../controller/loginscreen_controller.dart';

class LogInScreen extends GetView<LogInScreenController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Common.headerRow(),
                Text(
                  "Hello! \nWELCOME BACK",
                  textAlign: TextAlign.center,
                  style: GoogleFontsStyle.poppins(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Form(
                      key: controller.form,
                      child: Column(
                        children: [
                          Common.textFormFiled(
                            validator: (value) {
                              if (controller.emailController.text.isEmpty) {
                                return 'email is required';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(controller.emailController.text)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            controller: controller.emailController,
                            labeltext: "Email",
                            preicon: const Icon(Icons.email_outlined),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10)),
                          Common.textFormFiled(
                              validator: (value) {
                                if (controller.emailController.text.isEmpty) {
                                  return 'password is required';
                                }
                                if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(
                                        controller.emailController.text)) {
                                  return "Please enter a valid password ";
                                }
                                return null;
                              },
                              controller: controller.passController,
                              labeltext: "Password",
                              preicon: const Icon(Icons.lock),
                              suficon: const Icon(Icons.visibility)),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10)),
                          _text(text: "Forgot Password"),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10)),
                          Common.button(
                              text: "Log In",
                              onTap: () {
                                if (controller.form.currentState!.validate()) {}
                              }),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5)),
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
    );
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
