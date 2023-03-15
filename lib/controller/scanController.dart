import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ncapp/services/httpservice.dart';

import '../model/product.dart';

class ScanController extends ChangeNotifier {
  Map<String, dynamic> _product = Product.def().toJson();
  Map<String, dynamic> _productIn = Product.def().toJson();
  List<Map<String, dynamic>>? linkItems;
  String? dropName;
  String typeVal = '', nameVal = '', availableVal = '';
  String serialLink = 'Vinculado a';

  void resetNameVal() {
    nameVal = '';
    notifyListeners();
  }

  void switchAvailableVal(String val) {
    if (val == "Disponível")
      _productIn['available'] = 1;
    else
      _productIn['available'] = 0;
    availableVal = val;
    notifyListeners();
  }

  static TextEditingController state_ctrl = TextEditingController();

  static const type_options = <String>{"Drone", "Peça", "Caixa"};

  String? get getProdType => _productIn['typeProd'];

  void set setProdType(String prodInType) {
    this._productIn['typeProd'] = prodInType;
    name_options = _getName();
    notifyListeners();
  }

  set setHint(String serial) {
    serialLink = serial;
    notifyListeners();
  }

  get getProdSerial {
    return _productIn['serialProd'];
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
      log('requestThrow: ${err.toString()}');
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
    if (_product['pkProd'] == -1) {
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
    }
    this._product['serialProd'] = serial;
    this._productIn['serialProd'] = serial;
  }

  Future<void> createLink(
      {required String type,
      required String parentSerial,
      required String childSerial}) async {
    try {
      await http.insertLink(
          type: type, parentSerial: parentSerial, childSerial: childSerial);
    } catch (err) {
      rethrow;
    }
  }

  void register(BuildContext context) async {
    log('Product Register: ${_productIn.toString()}');
      String type = 'DronePart';
      if (_productIn['typeProd'] == 'Caixa')
        type = 'BoxDrone';

      _productIn['stateProd'] = state_ctrl.text;
      try {
        http.insertProduct(_productIn);
        await createLink(
            type: type,
            parentSerial: _productIn['serialProd'],
            childSerial: serialLink);
      } catch (err) {
        log('register: ' + err.toString());
        Fluttertoast.showToast(
          msg: 'Vínculo inválido! ',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 20,
          toastLength: Toast.LENGTH_LONG,);
        Navigator.of(context).pop();
        return;
      }

  }

  Future<void> requestLinkedItems(String serial, String type) async {
    List<Product> products = await http.getProducts(serial: serial, type: type);
    products.forEach((element) {
      linkItems?.add(element.toJson());
    });
  }

  void update() {}
}
