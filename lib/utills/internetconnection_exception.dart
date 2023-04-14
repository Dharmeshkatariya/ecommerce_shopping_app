import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';

class InternetConnectionScreen extends StatelessWidget {
  const InternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No internet Connect"),
      ),
      body: Container(
        padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Internet connection failed",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Common.button(text: "check internet connection"),
          ],
        ),
      ),
    );
  }
}
