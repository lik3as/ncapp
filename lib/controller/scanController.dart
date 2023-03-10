import 'package:flutter/cupertino.dart';
import 'package:ncapp/services/httpservice.dart';

import '../model/product.dart';

class ScanController extends ChangeNotifier {
  String dialogText = '';
  String dialogTitle = '';

  void update(Map product, String sn){
    if (product.isEmpty) {dialogText = 'Registrar'; dialogTitle = sn;}
    else {dialogText = 'Remover'; dialogTitle = product['productTitle'];}
    notifyListeners();
  }

  Future<Map<String, String>> authSerial(String serial) async {
    HttpService http = HttpService();
    try {
      Product product = await http.getProduct(serial);
      return product.toJson();
    } catch (err) {
      return Map();
    }
  }
}