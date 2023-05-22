import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/utills/appcolor.dart';
import 'package:furniture_shoping/controller/homescreen_controller.dart';
import 'package:furniture_shoping/modal/homescreen_modal/category_modal.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:furniture_shoping/utills/emptyscreen.dart';
import 'package:furniture_shoping/utills/google_font.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: AppColor.homeScreenIcon),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(NameRoutes.myCartScreen);
            },
            icon: const Icon(Icons.add_shopping_cart, color: AppColor.grey,),
          )
        ],
        title: Text(
          "makeHomeBeautiful".tr,
          textAlign: TextAlign.center,
          style: GoogleFontsStyle.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColor.grey),
        ),
      ),
      body: controller.obx(
        (state) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 95,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _horizontalListview(index);
                    }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GridView.count(
                      primary: false,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: List.generate(
                          controller.filterFinalList.isEmpty
                              ? controller.productList.length
                              : controller.filterFinalList.length,
                          (index) => _gridItem(index))),
                ),
              )
            ],
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: const EmptyScreen(),
      ),
    );
  }

  Widget _gridItem(int index) {
    ProductData productData = controller.filterFinalList.isEmpty
        ? controller.productList[index]
        : controller.filterFinalList[index];
    return GestureDetector(
      onTap: () {
        Get.toNamed(NameRoutes.productDetailScreen, arguments: {"productData": productData,"index" : index});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageStack(productData),
          _text(
            text: productData.productName,
            color: AppColor.grey,
          ),
          _text(
              text: " Rs ${productData.productPrice}",
              fontWeight: FontWeight.bold,color: AppColor.black),
        ],
      ),
    );
  }

  Widget _horizontalListview(int index) {
    CategoryData categoryData = controller.categoryList[index];
    return GestureDetector(
      onTap: () {
        controller.filterData(index);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: index == controller.selectedIndex.value
                  ? AppColor.black
                  : AppColor.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              "https://www.shutterstock.com/image-vector/vector-illustration-chair-on-white-260nw-1165935439.jpg",
              height: 30,
              width: 30,
            ),
          ),
          Text(
            categoryData.categoryName,
            style: GoogleFontsStyle.poppins(
                fontWeight: FontWeight.w600, fontSize: 14,color: AppColor.black),
          )
        ],
      ),
    );
  }

  Widget _text({required String text, FontWeight? fontWeight, Color? color}) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFontsStyle.poppins(
        color: color,
        fontWeight: FontWeight.bold,
        softWrap: false,
      ),
    );
  }

  Widget _imageStack(ProductData productData) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            height: 210,
            width: 210,
            productData.image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            bottom: 20,
            right: 10,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SvgPicture.asset("assets/icon/shopbeg.svg"),
              ),
            ))
      ],
    );
  }
}
