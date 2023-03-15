import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/product.dart';
import '../model/user.dart';

class HttpService {
  String rootUrl =
      'https://e380-2804-14c-cc80-89ae-b11d-a12f-39fb-db22.sa.ngrok.io/';
  String usersUrl = 'users/';
  String productsUrl = 'products/';
  String linkedUrl = 'linked/';

  HttpService() {
    usersUrl = rootUrl + usersUrl;
    productsUrl = rootUrl + productsUrl;
    linkedUrl = rootUrl + linkedUrl;
  }

  Future<User> getUser(String name, String password) async {
    http.Response response = await http.post(Uri.parse(usersUrl),
        headers: {
          "ngrok-skip-browser-warning": "69420",
          "content-type": "application/json",
        },
        body: jsonEncode(<String, String>{
          'nameUser': name,
          'pswUser': password,
        }));
    try {
      return User.fromJson(json.decode(response.body));
    } catch (err) {
      rethrow;
    }
  }

  Future<Product> getProduct(String serial) async {
    log('httpGetSerial: $serial');
    http.Response response =
        await http.get(Uri.parse(productsUrl + serial), headers: {
      'content-type': 'application/json',
    });

    if (response.body.isEmpty) throw "Produto Não Encontrado!";
    try {
      return Product.fromJson(json.decode(response.body));
    } catch (err) {
      rethrow;
    }
  }

  Future<void> insertProduct(Map product) async {
    await http.post(Uri.parse(productsUrl),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(product));
  }

  Future<List<Product>> getProducts(
      {required String type, required String serial}) async {
    http.Response response = await http.get(
        Uri.parse('${linkedUrl}${type}/${serial}'),
        headers: {'content-type': 'application/json'});
    log('getProducts: ${response.body.toString()}');
    return jsonDecode(response.body);
  }

  Future<void> insertLink(
      {required String type,
      required String parentSerial,
      required String childSerial}) async {
    try {
      log('PARENT: $parentSerial');
      log('CHILD: $childSerial');
      Product parent = Product.def();
      Product child = Product.def();
      parent = await getProduct(parentSerial);
      child = await getProduct(childSerial);

      log(parent.toJson()['pkProd'].toString());
      await http.post(Uri.parse('$linkedUrl$type'),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(<String, String>{
            'pkParent': parent.toJson()['pkProd'].toString(),
            'pkChild': child.toJson()['pkProd'].toString(),
          }));
    } catch (err) {
      log('InsertLinkFail: ${err.toString()}');
      rethrow;
    }
  }

  void disableProduct() {}
}
