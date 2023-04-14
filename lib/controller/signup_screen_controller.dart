import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController{
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final mobileController = TextEditingController();
  final confirmPassController = TextEditingController();
  final form = GlobalKey<FormState>();



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