import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/utills/google_font.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Common.headerRow(),
              Text('WELCOME',style: GoogleFontsStyle.poppins(fontSize: 32,fontWeight: FontWeight.w600),),

            ],
          ),
        ),
      ),
    );
  }
}
