import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/controller/dashboard_screen_controller.dart';
import 'package:get/get.dart';

class DashBoardScreen extends GetView<DashBoardScreenController> {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.bottomNavigation,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _button(
                    index: 0,
                    svg: SvgPicture.asset(
                      "assets/icon/home.svg",
                      color: controller.page.value == 0
                          ? Colors.black
                          : Colors.grey,
                    )),
                _button(
                    index: 1,
                    svg: SvgPicture.asset(
                      "assets/icon/cart.svg",
                      color: controller.page.value == 1
                          ? Colors.black
                          : Colors.grey,
                    )),
                _button(
                    index: 2,
                    svg: SvgPicture.asset(
                      "assets/icon/bell.svg",
                      color: controller.page.value == 2
                          ? Colors.black
                          : Colors.grey,
                    )),
                _button(
                    index: 3,
                    svg: SvgPicture.asset(
                      "assets/icon/person.svg",
                      color: controller.page.value == 3
                          ? Colors.black
                          : Colors.grey,
                    )),
              ],
            ),
          ),
          body: Container(
            child: controller.mList[controller.page.value],
          ),
        ));
  }


  
  Widget _button({Widget? svg, required int index}) {
    return GestureDetector(
        onTap: () {
          controller.navigationTaped(index);
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: svg,
        ));
  }
}
