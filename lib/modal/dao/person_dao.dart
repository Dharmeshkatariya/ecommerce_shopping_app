// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:furniture_shoping/modal/entity/person_entity.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);

  @Query('DELETE FROM Person WHERE id = :id')
  Future<void> deleteById(int id);

  @insert
  Future<void> insertPerson(Person person);
}