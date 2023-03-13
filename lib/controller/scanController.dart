import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ncapp/services/httpservice.dart';

import '../model/product.dart';

class ScanController extends ChangeNotifier {
  Map<String, dynamic> _product = Product.def().toJson();
  bool isCrate = false;
  String dialogBtn = '';
  String dialogTitle = '';
  String bodyText = 'Não é um S/N';

  final HttpService http = HttpService();

  Future<void> alertUpdate(String serial) async {
    try {
      await requestProduct(serial);
    } catch (err) {
      Fluttertoast.showToast(
        msg: err.toString(),
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 18,
        toastLength: Toast.LENGTH_LONG,
      );
      rethrow;
    }

    dialogTitle = _product['serialProd'];
    if (_product.isEmpty || _product['pkProd'] == -1) {
      dialogBtn = 'Registrar';
      bodyText = 'Este S/N ainda não foi registrado!';
      notifyListeners();
      return;
    }
    dialogBtn = 'Remover';
    bodyText = 'Este S/N já foi registrado anteriormente';
    notifyListeners();
}

  void bodyUpdate() {}

  Future<void> requestProduct(String serial) async {
    if (serial.contains(RegExp('[/]|[|]|[:]|[-]'))) {
      throw Exception("NÃO É UM S/N");
    }
    try {
      Product product = await http.getProduct(serial);
      _product.addEntries(product.toJson().entries);
    } catch (err) {
      log('requestProduct: ' + err.toString());
      rethrow;
    }
    this._product['serialProd'] = serial;
  }

  void register() {
    if (_product.isEmpty) return;
    try {
      http.insertProduct(_product);
    } catch (err) {
      log('register: ' + err.toString());
    }
  }

  void remove() {}
}
