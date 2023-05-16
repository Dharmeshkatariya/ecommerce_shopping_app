// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Address {
  @primaryKey
  final int id;

  final String name;
  final String address;
  final int zipcode;
  final String country;
  final String city;
  final String district;


  Address(this.id, this.name,this.address,this.zipcode,this.country,this.city,this.district);
}