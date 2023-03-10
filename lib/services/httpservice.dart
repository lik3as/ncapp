import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/User.dart';

class HttpService {
  String rootUrl = 'http://localhost:8080/';
  String usersUrl =
      'https://59a2-2804-14c-cc80-89ae-b11d-a12f-39fb-db22.sa.ngrok.io/users';

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
}
