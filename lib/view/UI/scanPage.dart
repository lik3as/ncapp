import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  void scan() async{
    String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        "#ff0d11", "Cancel", true, ScanMode.DEFAULT);
  }
  @override
  Widget build(BuildContext context) {
    scan();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100; //Removendo Barra
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(14, 239, 144, 1),
        title: const Center(
          widthFactor: 2.5,
          child: Text(
            "ESCANEAR",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: sizePercent(height, 5),
            ),
            Center(
              child: Image.asset(
                "assets/ncaicon.png",
                width: 250,
                height: 250,
              ),
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
