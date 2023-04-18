// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:furniture_shoping/modal/entity/product_entity.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Product')
  Future<List<Product>> findAllProduct();

  @Query('SELECT * FROM Product WHERE id = :id')
  Stream<Product?> findProductById(int id);

  @insert
  Future<int> insertProduct(Product product);
}