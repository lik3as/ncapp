import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ncapp/services/httpservice.dart';

import '../model/product.dart';

class ScanController extends ChangeNotifier {
  Map<String, dynamic> _product = Product.def().toJson();
  Map<String, dynamic> _productIn = Product.def().toJson();
  List<Map<String, dynamic>>? items;
  String? dropName;
  String typeVal = '', nameVal = '', availableVal = '';

  void resetNameVal(){
    nameVal = '';
    notifyListeners();
  }

  void switchAvailableVal(String val){
    availableVal = val;
    notifyListeners();
  }

  static TextEditingController name_ctrl = TextEditingController(),
      type_ctrl = TextEditingController(),
      available_ctrl = TextEditingController(),
      prod_ctrl = TextEditingController(),
      state_ctrl = TextEditingController();

  static const type_options = <String>{"Drone", "Peça", "Caixa"};

  String? get getProdType => _productIn['typeProd'];

  void set setProdType(String prodInType) {
    this._productIn['typeProd'] = prodInType;
    name_options = _getName();
    notifyListeners();
  }

  static List<String> name_options = ['Padrão'];

  String? get getNameProd => _productIn['nameProd'];

  set setProdName(String prodInName) {
    this._productIn['nameProd'] = prodInName;
    notifyListeners();
  }


  List<String> _getName() {
    switch (_productIn['typeProd']) {
      case ("Drone"):
        {
          name_options = <String>[
            "Agras T40",
            "Agras T30",
            "DJI Mini 2",
          ];
          return name_options;
        }
      case ("Peça"):
        {
          name_options = <String>[
            "SUPER CHARGER 220",
            "SUPER CHARGER 110",
          ];
          return name_options;
        }
      default:
        {
          name_options = <String>[
            "DJI",
            "VARIAS",
          ];
          return name_options;
        }
    }
  }

  //NAME AREA -------------------------------------------------

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
    dialogBtn = 'Atualizar';
    bodyText = 'Este S/N já foi registrado antes';
    notifyListeners();
  }

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
    this._productIn['serialProd'] = serial;
  }

  void register() {
    if (_product.isEmpty) return;
    _productIn['nameProd'] = name_ctrl.text;
    _productIn['typeProd'] = type_ctrl.text;
    _productIn['stateProd'] = state_ctrl.text;
    _productIn['avaliable'] = available_ctrl.text;
    try {
      http.insertProduct(_product);
    } catch (err) {
      log('register: ' + err.toString());
    }
  }

  void requestLinkedItems(String serial){
  }

  void update() {}
}
