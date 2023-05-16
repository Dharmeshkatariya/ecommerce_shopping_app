import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/modal/entity/address_entity.dart';
import 'package:furniture_shoping/modal/entity/cart_entity.dart';
import 'package:furniture_shoping/modal/entity/product_entity.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'database.dart';

class Common {
  int getRandomId() {
    var random = Random();

    return random.nextInt(100);
  }

  static var database;

  initDatabase() async {
    database ??=
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  insertData(Product product) async {
    try {
      final productDao = database.productDao;
      var res = await productDao.insertProduct(product);
      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getAllData() async {
    final productDao = database.productDao;
    List<Product> res = await productDao.findAllProduct();
    print(res);
    return res;
  }

  Future<Product?> getProductById(int id) async {
    try {
      final productDao = database.productDao;
      var res = await productDao.findProductById(id);

      return res;
    } catch (e) {
      print(e);
    }
  }

  updateProduct(Product product) async {
    try {
      final productDao = database.productDao;
      var res = await productDao.updateProductById(
          product.id,
          product.productName,
          product.productPrice,
          product.productPrice,
          product.productImage);

      print(res);
    } catch (e) {
      print(e);
    }
  }

  deleteProduct(int productId) async {
    try {
      final productDao = database.productDao;
      await productDao.deleteById(productId);
      getAllData();
    } catch (e) {
      print(e);
    }
  }

  insertAddress(Address address) async {
    try {
      final addressDao = database.addressDao;
      var res = await addressDao.insertAddress(address);
      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Address>> getAllAddress() async {
    final addressDao = database.addressDao;
    List<Address> res = await addressDao.findAllAddress();
    print(res);
    return res;
  }

  deleteCartItem(int cartId) async {
    try {
      final cartDao = database.cartDao;
      await cartDao.deleteById(cartId);
      getAllData();
    } catch (e) {
      print(e);
    }
  }

  insertCard(Cart cart) async {
    try {
      final cartDao = database.cartDao;
      print('');
      if (cartDao != null) {
        var res = await cartDao.insertCart(cart);
        print(res);
        getAllCard();
      }
    } catch (e) {
      print(e);
    }
  }

  updateCart( int cartQty,int cartId,) async {
    try {
      final cartDao = database.cartDao;

      var res = await cartDao.updateQty(cartQty, cartId);

      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Cart>> getAllCard() async {
    final cartDao = database.cartDao;
    List<Cart> res = await cartDao.findAllCarts();
    print(res);
    return res;
  }

  static Widget button({
    required String text,
    GestureTapCallback? onTap,
    double? width,
  }) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400, fontSize: 17, color: Colors.white),
          ),
        ));
  }

  static Widget textFormFiled({
    Widget? suficon,
    Widget? preicon,
    TextEditingController? controller,
    String? labeltext,
    dynamic validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          labelText: labeltext,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey)),
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: labeltext,
          hintStyle: const TextStyle(color: Colors.black),
          focusColor: Colors.black,
          hoverColor: Colors.black,
          suffixIcon: suficon,
          prefixIcon: preicon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }

  static Widget headerRow() {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 1),
        )),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
        SvgPicture.asset("assets/icon/login.svg"),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
        Expanded(
            child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 1),
        )),
      ],
    );
  }

  static dialogBox(String title, String msg) {
    return Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          height: 200,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(msg),
            ],
          ),
        ),
      ),
    ));
  }

  static commonSnabar(String title, String msg) {
    return Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      overlayColor: Colors.red,
      backgroundColor: Colors.red.shade100,
    );
  }
}
