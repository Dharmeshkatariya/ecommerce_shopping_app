import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/routes/pageroute.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:furniture_shoping/utills/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'langauge/langauge.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialColor mainAppColor = const MaterialColor(0xFFFFFFFF, <int, Color>{
    //   50: Color(0xFFFFFFFF),
    //   100: Color(0xFFFFFFFF),
    //   200: Color(0xFFFFFFFF),
    //   300: Color(0xFFFFFFFF),
    //   400: Color(0xFFFFFFFF),
    //   500: Color(0xFFFFFFFF),
    //   600: Color(0xFFFFFFFF),
    //   700: Color(0xFFFFFFFF),
    //   800: Color(0xFFFFFFFF),
    //   900: Color(0xFFFFFFFF),
    // });
    //
    // MaterialColor mainAppColorDark = const MaterialColor(0xFF000000, <int, Color>{
    //   50: Color(0xFF000000),
    //   100: Color(0xFF000000),
    //   200: Color(0xFF000000),
    //   300: Color(0xFF000000),
    //   400: Color(0xFF000000),
    //   500: Color(0xFF000000),
    //   600: Color(0xFF000000),
    //   700: Color(0xFF000000),
    //   800: Color(0xFF000000),
    //   900: Color(0xFF000000),
    // });

    return GetMaterialApp(
      theme: AppTheme().lightTheme,
      translations: Langaugae(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      getPages: PageRoutes.pages,
      debugShowCheckedModeBanner: false,
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
    _login();
    super.initState();
  }

  _login() async {
    await Common().initDatabase();
    var shareP = await SharedPreferences.getInstance();
    bool isLogin = shareP.getBool("login") ?? false;
    Timer(const Duration(seconds: 3), () {
      if (isLogin) {
        Get.offNamed(NameRoutes.dashBoardScreen);
      } else {
        Get.offNamed(NameRoutes.loginScreen);
      }
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
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Common.button(text: "Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
