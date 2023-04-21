import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/utills/google_font.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "SUCCESS!",
                      style: GoogleFontsStyle.poppins(
                          fontWeight: FontWeight.w600, fontSize: 32),
                    ),
                    Image.asset("assets/image/orderdone.png"),
                    const Text(
                        "Your order will be delivered soon. \nThank you for choosing our app!"),
                  ],
                ),
              ),
              Common.button(text: "Track your orders"),
              Common.button(text: "Back to home"),
            ],
          ),
        ),
      ),
    );
  }
}
