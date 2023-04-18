// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:furniture_shoping/modal/dao/cart_dao.dart';
import 'package:furniture_shoping/modal/entity/cart_entity.dart';
import 'package:furniture_shoping/modal/dao/product_dao.dart';
import 'package:furniture_shoping/modal/entity/product_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'modal/entity/person_entity.dart';
import 'modal/dao/person_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 3, entities: [Person, Product, Cart])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;

  ProductDao get productDao;

  CartDao get cartDDao;
}
