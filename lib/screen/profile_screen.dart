import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/profilescreen_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
