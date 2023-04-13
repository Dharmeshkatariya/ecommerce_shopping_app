import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/routes/pageroute.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: PageRoutes.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    _splashScreen();
    super.initState();
  }

  _splashScreen() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Get.offNamed(NameRoutes.loginScreen);
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/image/splash.png",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "MAKE YOUR \nHOME BEAUTIFUL",
                style: GoogleFontsStyle.poppins(
                    fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 10),
              child: Text(
                "The best simple place where you \ndiscover most wonderful furnitures \nand make your home beautiful",
                style: GoogleFontsStyle.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 640, bottom: 20),
              child: Common.button(text: "Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
