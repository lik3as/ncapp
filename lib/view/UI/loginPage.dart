import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height - 100; //Removendo Barra
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(14, 239, 144, 1),
        title: const Center(
          widthFactor: 1.6,
          child: Text(
            "AUTENTIFICAÇÃO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: sizePercent(height, 8)),
            Center(child: Image.asset(
              "assets/ncaicon.png", height: 250, width: 250,)),
            const TextField(
              decoration: InputDecoration(),
            )
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
