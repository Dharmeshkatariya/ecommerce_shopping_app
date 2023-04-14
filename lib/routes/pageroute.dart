import 'package:furniture_shoping/binding/loginscreen_binding.dart';
import 'package:furniture_shoping/binding/signup_screen_binding.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/screen/signup_screen.dart';
import 'package:get/get.dart';

import '../screen/loginscreen.dart';

class PageRoutes {
  static final pages = [
    GetPage(
        name: NameRoutes.loginScreen,
        page: () => LogInScreen(),
        binding: LogInScreenBinding()),
    GetPage(
        name: NameRoutes.signUpScreen,
        page: () => SignUpScreen(),
        binding: SignUpScreenBinding(),
    ),
  ];
}
