import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/common.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favoutire",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return _favList(index);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Common.button(text: "Add all to my cart", onTap: () {}),
        ]),
      ),
    );
  }

  Widget _favList(int index) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    "https://w7.pngwing.com/pngs/606/648/png-transparent-california-style-pizza-sicilian-pizza-chrono-pizza-fast-food-pizza-menu-food-recipe-pizza-delivery-thumbnail.png"),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("add data"),
                        Icon(Icons.close),
                      ],
                    ),
                   const  Text("add data"),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.shopping_cart),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
