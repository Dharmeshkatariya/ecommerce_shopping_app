import 'package:furniture_shoping/binding/dashboardscreen_binding.dart';
import 'package:furniture_shoping/binding/loginscreen_binding.dart';
import 'package:furniture_shoping/binding/productdetail_binding.dart';
import 'package:furniture_shoping/binding/signup_screen_binding.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/screen/dashboard_screen.dart';
import 'package:furniture_shoping/screen/product_detail_screen.dart';
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
    GetPage(
      name: NameRoutes.dashBoardScreen,
      page: () => DashBoardScreen(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.productDetailScreen,
      page: () => ProductDetailScreen(),
      binding: ProductDetailScreenBinding(),
    ),
  ];
}
