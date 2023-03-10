import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  void scan(ScanMode scanMode) async {
    String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        "#ff0d11", "Cancel", true, scanMode);
    Fluttertoast.showToast(
        msg: barcodeScan,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.black,
    backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
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
            ),
            SizedBox(
              height: sizePercent(height, 8),
            ),
            Center(
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
                onPressed: () => scan(ScanMode.QR),
                child: Text("QR-CODE"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
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
                  onPressed: () => scan(ScanMode.BARCODE),
                  child: Text("BARCODE"),
                ),
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
