// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Cart {
  @primaryKey
  final int id;

  final String cartProductName;
  final double cartProductPrice;
  final String cartProductImage;
  int cartProductOty;

  Cart(
    this.id,
    this.cartProductName,
    this.cartProductPrice,
    this.cartProductImage,
    this.cartProductOty,
  );
}
