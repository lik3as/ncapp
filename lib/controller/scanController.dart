import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ncapp/services/httpservice.dart';

import '../model/product.dart';

class ScanController extends ChangeNotifier {
  Map<String, String> _product = {};
  String barcode = '';
  String dialogBtn = '';
  String dialogTitle = '';

  void alertUpdate(){
    if (_product.isEmpty){
      dialogTitle = barcode;
      dialogBtn = 'Registrar';
      notifyListeners();
      return;
    }
    dialogBtn = 'Remover';
    dialogTitle = _product['nameProd']!;

  }

  void bodyUpdate(){

  }

  void requestProduct(String serial) async {
    barcode = serial;
    HttpService http = HttpService();
    try {
      Product product = await http.getProduct(serial);
      this._product = product.toJson();
    } catch (err) {
      log('Product is Empty');
      log(err.toString());
    }
  }

  void register(){

  }

  void remove(){

  }
}