import 'package:flutter/material.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_rounded)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "My orders",
          style: GoogleFontsStyle.poppins(
            color: Colors.black
              ,
              fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Container(),
    );
  }
}
