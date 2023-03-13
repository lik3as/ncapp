import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/product.dart';
import '../model/user.dart';

class HttpService {
  String rootUrl = 'https://9824-2804-14c-cc80-89ae-b11d-a12f-39fb-db22.sa.ngrok.io';
  String usersUrl =
      'https://73ad-2804-14c-cc80-89ae-b11d-a12f-39fb-db22.sa.ngrok.io/users/';
  String productsUrl =
      'https://73ad-2804-14c-cc80-89ae-b11d-a12f-39fb-db22.sa.ngrok.io/products/';

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
    log(serial);
    log(productsUrl + serial);
    http.Response response =
        await http.get(Uri.parse(productsUrl + serial), headers: {
      'content-type': 'application/json',
    });

    try {
      return Product.fromJson(json.decode(response.body));
    } catch (err) {
      return Product.fromJson(Product.def().toJson());
    }
  }

  void insertProduct(Map product) async {
    http.Response response = await http.post(Uri.parse(productsUrl),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(product));

  }

  void disableProduct() {}
}
