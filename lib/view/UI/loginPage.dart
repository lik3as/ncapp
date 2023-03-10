import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ncapp/controller/loginController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String userField = "";
  String passwordField = "";

  get username => userField;

  get password => passwordField;

  LoginController loginCtrl = LoginController();
  final userTxtCtrl = TextEditingController();
  final pswTxtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100; //Removendo Barra
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(14, 239, 144, 1),
        title: const Center(
          widthFactor: 2.5,
          child: Text(
            "AUTENTIFICAÇÃO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: sizePercent(height, 5)),
            Center(
                child: Image.asset(
              "assets/ncaicon.png",
              height: 250,
              width: 250,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: userTxtCtrl,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Jost",
                ),
                decoration: const InputDecoration(
                  hintText: "Usuário",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                onChanged: (value) => userField = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: pswTxtCtrl,
                style: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
                  hintText: "Senha",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                onChanged: (value) => passwordField = value,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Jost",
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => loginCtrl
                    .authUser(userTxtCtrl.text, pswTxtCtrl.text)
                    .then((value) =>
                        {if (value) Navigator.pushNamed(context, '/scan')}),
                child: const Text("Submeter"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double sizePercent(double screenSize, double percent) {
    if (percent > 100) return 0;
    return (percent / 100) * screenSize;
  }
}
