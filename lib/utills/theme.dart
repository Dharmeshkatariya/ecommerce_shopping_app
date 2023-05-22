import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shoping/utills/appcolor.dart';

class AppTheme {
   MaterialColor mainAppColor = const MaterialColor(0xFFFFFFFF, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });
  final lightTheme = ThemeData(

    primarySwatch: AppColor.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.black,
    canvasColor: Colors.white,
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
    iconTheme: IconThemeData(color: AppColor.black),
  );

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    indicatorColor: Colors.white,
    canvasColor: Colors.black,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: AppColor.white),
    ),
  );
}
