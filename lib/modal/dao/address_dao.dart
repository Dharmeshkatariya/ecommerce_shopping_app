// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:furniture_shoping/modal/entity/address_entity.dart';

@dao
abstract class AddressDao {
  @Query('SELECT * FROM Address')
  Future<List<Address>> findAllAddress();

  @Query('SELECT * FROM Address WHERE id = :id')
  Stream<Address?> findAddressById(int id);

  @Query('DELETE FROM Address WHERE id = :id')
  Future<void> deleteById(int id);

  @insert
  Future<void> insertAddress(Address Address);


}