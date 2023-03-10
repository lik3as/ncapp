class Product {
  int pk;
  int fkCrate;
  String serial;
  String name;
  String type;
  Map<String, String> state;
  bool available;

  Product(
      {required this.pk,
      required this.serial,
      required this.name,
      required this.type,
      required this.state,
      required this.available,
      required this.fkCrate}) {}

  factory Product.fromJson(Map Json) {
    return Product(
      pk: Json['pkProd'],
      serial: Json['serialProd'],
      name: Json['nameProd'],
      type: Json['typeProd'],
      state: Json['stateProd'],
      available: Json['avaliable'],
      fkCrate: Json['fkCrate']
    );
  }

  Map<String, String> toJson(
      ) {
    return {
      'pkProd': this.pk.toString(),
      'serialProd': this.serial,
      'nameProd': this.name,
      'typeProd': this.type,
      'stateProd': this.state.toString(),
      'avaliable': this.available.toString(),
    };
  }
}
