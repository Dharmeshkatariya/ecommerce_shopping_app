import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';

import '../screen/loginscreen.dart';

class PageRoutes {
  static final pages = [
    GetPage(name: NameRoutes.loginScreen, page: () => LogInScreen()),
  ];
}
