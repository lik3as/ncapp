import 'package:flutter/cupertino.dart';
import 'package:ncapp/services/httpservice.dart';
import 'package:ncapp/view/UI/loginPage.dart';

import '../model/User.dart';

class LoginController extends ChangeNotifier{

  updateValue(var data){
    notifyListeners();
  }

  Future<bool> authUser(String name, password) async{
    HttpService http = HttpService();
    User user = await http.getUser(name, password);
    return (user.name == name && user.psw == password) ? true : false;
  }
}