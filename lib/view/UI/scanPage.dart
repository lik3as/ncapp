import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:ncapp/controller/scanController.dart';
import 'package:ncapp/view/widgets/bodyText.dart';
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
              child: TextButton.icon(
                icon: Icon(Icons.qr_code_2),
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
                label: Text("CÓDIGO QR"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: TextButton.icon(
                  icon: Icon(Icons.barcode_reader),
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
                  label: Text("CÓDIGO DE BARRAS"),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.dataset), label: 'STOCK'),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_2_rounded), label: 'SCAN'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_box), label: 'REQUEST')
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          useLegacyColorScheme: true,
          fixedColor: Colors.green,
          iconSize: 35),
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

    try {
      await scanController.alertUpdate(barcodeScan);
    } catch (e) {
      return;
    }

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
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  ctrl.bodyText,
                                  style: TextStyle(fontFamily: 'Jost'),
                                ),
                              ),
                              ScanBodyText(
                                ctrl: scanController,
                              )
                            ],
                          )),
                    ),
                  ),
                  actions: [
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
                          (ctrl.dialogBtn == "Registrar")
                              ? ctrl.register()
                              : ctrl.update()
                        },
                        child: Text(ctrl.dialogBtn),
                      ),
                    ),
                  ],
                );
              }),
            ));
  }
}
