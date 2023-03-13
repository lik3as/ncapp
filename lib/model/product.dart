import 'dart:convert';
import 'dart:ffi';

class Product {
  int pk;
  int? fkCrate;
  String serial;
  String name;
  String type;
  String state;
  int available;

  Product({required this.pk,
    required this.serial,
    required this.name,
    required this.type,
    required this.state,
    required this.available,
    required this.fkCrate}) {}

  factory Product.def(){
    return Product(
        pk: -1,
        serial: '',
        name: '',
        type: '',
        state: "N/A",
        available: 0,
        fkCrate: -1);
  }

  factory Product.fromJson(Map<String, dynamic> Json) {
    return Product(
        pk: Json['pkProd'] as int,
        serial: Json['serialProd'],
        name: Json['nameProd'],
        type: Json['typeProd'],
        state: Json['stateProd'],
        available: Json['avaliable'] as int,
        fkCrate: (Json['fkCrate'] == null) ? -1 : Json['fkCrate'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pkProd': this.pk,
      'serialProd': this.serial,
      'nameProd': this.name,
      'typeProd': this.type,
      'stateProd': this.state,
      'avaliable': this.available,
      'fkCrate': this.fkCrate,
    };
  }
}
