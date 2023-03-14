import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/product.dart';
import '../model/user.dart';

class HttpService {
  String rootUrl =
      'https://19fd-2804-14c-cc80-89ae-b11d-a12f-39fb-db22.sa.ngrok.io/';
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
    await http.post(Uri.parse(productsUrl),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(product));
  }

  Future<List<Product>> getProducts({required String serial}) async {
    http.Response response = await http.get(Uri.parse(linkedUrl + serial),
        headers: {'content-type': 'application/json'});
    log(response.body.toString());
    return jsonDecode(response.body);
  }

  void disableProduct() {}
}
