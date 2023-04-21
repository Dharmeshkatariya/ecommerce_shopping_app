// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Product {
  @primaryKey
  final int id;

  final String productName;
  final String productImage;
  final double productPrice;
  final int productQty;
   bool isSelect;

  Product(this.id, this.productName, this.productImage, this.productPrice,
      this.productQty, this.isSelect);
}
