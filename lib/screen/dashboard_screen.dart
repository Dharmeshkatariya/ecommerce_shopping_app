import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/dashboard_screen_controller.dart';
import 'package:get/get.dart';

class DashBoardScreen extends GetView<DashBoardScreenController> {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: controller.page.value,
        onTap: (index) => {
          controller.navigationTaped(index),
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color:
                      controller.page.value == 0 ? Colors.black : Colors.white),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color:
                      controller.page.value == 1 ? Colors.black : Colors.white),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle,
                  color:
                      controller.page.value == 2 ? Colors.black : Colors.white),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                  color:
                      controller.page.value == 3 ? Colors.black : Colors.white),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color:
                      controller.page.value == 4 ? Colors.black : Colors.white),
              label: "",
              backgroundColor: Colors.black),
        ],
      ),
      body: Container(
        child: controller.mList[controller.page.value],
      ),
    );
  }
}
