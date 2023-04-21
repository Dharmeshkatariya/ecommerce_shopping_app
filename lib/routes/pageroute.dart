import 'package:furniture_shoping/binding/cart_screen_binding.dart';
import 'package:furniture_shoping/binding/dashboardscreen_binding.dart';
import 'package:furniture_shoping/binding/favourite_binding.dart';
import 'package:furniture_shoping/binding/loginscreen_binding.dart';
import 'package:furniture_shoping/binding/productdetail_binding.dart';
import 'package:furniture_shoping/binding/rating_review_binding.dart';
import 'package:furniture_shoping/binding/signup_screen_binding.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/screen/checkout_screen.dart';
import 'package:furniture_shoping/screen/dashboard_screen.dart';
import 'package:furniture_shoping/screen/product_detail_screen.dart';
import 'package:furniture_shoping/screen/rating_review_screen.dart';
import 'package:furniture_shoping/screen/signup_screen.dart';
import 'package:furniture_shoping/screen/success_order_screen.dart';
import 'package:get/get.dart';

import '../screen/favourite_screen.dart';
import '../screen/loginscreen.dart';
import '../screen/mycartlist_screen.dart';

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
    GetPage(
      name: NameRoutes.myCartScreen,
      page: () => MyCartListScreen(),
      binding: MyCartScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.favouriteScreen,
      page: () => FavouriteScreen(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: NameRoutes.ratingReviewScreen,
      page: () => RatingReviewScreen(),
      binding: RatingReviewBinding(),
    ),
    GetPage(
      name: NameRoutes.checkoutScreen,
      page: () => CheckOutScreen(),
    ),
    GetPage(
      name: NameRoutes.succeessOrderScreen,
      page: () => SuccessOrderScreen(),
    ),
  ];
}
