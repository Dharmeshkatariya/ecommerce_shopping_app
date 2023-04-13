import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/utills/google_font.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Common.headerRow(),
              Text(
                "Hello! \nWELCOME BACK",
                textAlign: TextAlign.center,
                style: GoogleFontsStyle.poppins(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
           Column(
             children: [
               Common.textFormFiled(
                 labeltext: "Email",
               ),
               const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
               Common.textFormFiled(
                 labeltext: "Password",
               ),
               const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
               _text(text: "Forgot Password"),
               Common.button(text: "Log In"),
               _text(text: "Sign up"),
             ],
           )
            ],
          ),
        ),
      ),
    );
  }

  Widget _text({required String text}) {
    return Text(
      text,
      style: GoogleFontsStyle.inter(fontWeight: FontWeight.w400, fontSize: 16),
    );
  }
}
