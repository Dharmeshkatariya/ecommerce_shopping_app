// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:furniture_shoping/modal/cart_entity.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM Person')
  Future<List<Cart>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Cart?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Cart cart);
}