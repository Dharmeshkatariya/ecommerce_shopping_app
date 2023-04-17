import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Common {
  static Widget button({required String text,GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
        child: Container(



      alignment: Alignment.center,
      decoration:  BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w400, fontSize: 17, color: Colors.white),
      ),
    ));
  }

  static Widget textFormFiled(
      {
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
