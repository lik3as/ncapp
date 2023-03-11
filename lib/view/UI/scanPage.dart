import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ncapp/controller/scanController.dart';
import 'package:provider/provider.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});


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
                onPressed: () => scan(ScanMode.QR, context),
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
                  onPressed: () => scan(ScanMode.BARCODE, context),
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

  void scan(ScanMode scanMode, BuildContext context) async {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100; //Removendo Barra
    final ScanController scanController = ScanController();

    double size = sizePercent(height, 60);
    String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        "#ff0d11", "Cancel", true, scanMode);
    scanController.requestProduct(barcodeScan);
    scanController.alertUpdate();
    showDialog(
        context: context,
        builder: (BuildContext context) => ChangeNotifierProvider(
          create: (context) => scanController,
          child: Consumer<ScanController>(builder: (context, ctrl, child) {
            return AlertDialog(
              titleTextStyle: TextStyle(
                  fontFamily: 'Jost', fontSize: 14, color: Colors.black),
              title: Text(ctrl.dialogTitle),
              content: SizedBox(
                height: sizePercent(height, 60),
                child: Text('aa'),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Jost",
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => {Navigator.pop(context)},
                    child: Text('Cancelar'),
                  ),
                ),

                //Register / Remove
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Jost",
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => {
                      (ctrl.dialogBtn == "Registrar") ? ctrl.register() : ctrl.remove()
                    },
                    child: Text(ctrl.dialogBtn),
                  ),
                )
              ],
            );
          }),
        ));
  }

}
