import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shoping/modal/product_entity.dart';
import 'package:google_fonts/google_fonts.dart';

import 'database.dart';

class Common {
  int getRandomId() {
    var random = Random();
    return random.nextInt(100);
  }

  static var database;

  initDatabase() async {
    database ??= await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  insertData(Product product) async {
    try {
      database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      final productDao = database.productDao;

      var res = await productDao.insertProduct(product);
      print(res);
      getAllData();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getAllData() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final productDao = database.productDao;
    List<Product> res = await productDao.findAllProduct();
    print(res);
    return res;
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

  insertCard(Card card) async {
    try {
      final cardDao = database.cardDao;

      var res = await cardDao.insertCard(card);
      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Card>> getAllCard() async {
    final cardDao = database.cardDao;
    List<Card> res = await cardDao.findAllCards();
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
}