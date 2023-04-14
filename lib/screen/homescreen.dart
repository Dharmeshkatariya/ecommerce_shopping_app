import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shoping/utills/google_font.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.grey.shade600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart, color: Colors.grey),
          )
        ],
        title: Text(
          "MAKE HOME \nBEAUTIFUL",
          textAlign: TextAlign.center,
          style: GoogleFontsStyle.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return _horizontalListview(index);
                  }),
            ),
            Expanded(
              child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(20, (index) => _gridItem(index))),
            )
          ],
        ),
      ),
    );
  }

  Widget _gridItem(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageStack(),
          _text(text: "virat lojhi", color: Colors.grey),
          _text(text: "price", fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget _text({required String text, FontWeight? fontWeight, Color? color}) {
    return Text(
      text,
      style: GoogleFontsStyle.poppins(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _imageStack() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            height: 210,
            width: 200,
            "https://i.pinimg.com/736x/58/f5/29/58f5295e76b6bd5dbe0cc0c55a98ce5a.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 30,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        )
      ],
    );
  }

  Widget _horizontalListview(int index) {
    return Card(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/image/splash.png",
              height: 30,
              width: 30,
            ),
          ),
          Text(
            "Popular",
            style: GoogleFontsStyle.poppins(
                fontWeight: FontWeight.w600, fontSize: 14),
          )
        ],
      ),
    );
  }
}
