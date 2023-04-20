import 'package:flutter/cupertino.dart';
import 'package:furniture_shoping/screen/favourite_screen.dart';
import 'package:furniture_shoping/screen/homescreen.dart';
import 'package:furniture_shoping/screen/notification_screen.dart';
import 'package:furniture_shoping/screen/profile_screen.dart';
import 'package:get/get.dart';

class DashBoardScreenController extends GetxController with StateMixin<List<Widget>> {
  List<Widget> mList = [
    HomeScreen(),
    FavouriteScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  RxInt page = 0.obs;

  navigationTaped(int index) {
    page.value = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    change(mList, status: RxStatus.loading());
    change(mList, status: RxStatus.success());
    super.onInit();
  }
}
