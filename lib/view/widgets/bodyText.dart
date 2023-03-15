import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../controller/scanController.dart';

class ScanBodyText extends StatelessWidget {
  final ScanController ctrl;

  ScanBodyText({required this.ctrl});

  List<String> available = ['Disponível', 'Não está disponível'];

  double sizePercent(double screenSize, double percent) {
    if (percent > 100) return 0;
    return (percent / 100) * screenSize;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100; //Removendo Barra
    return SizedBox(
      height: sizePercent(height, 60),
      width: sizePercent(width, 65),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonFormField(
              hint: Text("Tipo do item "),
              isExpanded: true,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 13,
                ),
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              onChanged: (val) {
                ctrl.setProdType = val.toString();
                ctrl.typeVal = val.toString();
                ctrl.resetNameVal();
              },
              items: ScanController.type_options
                  .map((op) => DropdownMenuItem(
                        child: Text(op),
                        value: op,
                      ))
                  .toList(),
              value: (ctrl.typeVal.isEmpty) ? null : ctrl.typeVal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonFormField(
              hint: Text("Nome do item "),
              isExpanded: true,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 13,
                ),
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              onChanged: (val) {
                ctrl.setProdName = val.toString();
                ctrl.nameVal = (ctrl.getNameProd != null) ? val.toString() : '';
              },
              items: ScanController.name_options
                  .map((op) => DropdownMenuItem(
                        child: Text(op),
                        value: op,
                      ))
                  .toList(),
              value: (ctrl.nameVal.isEmpty) ? null : ctrl.nameVal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonFormField(
              hint: Text("Disponibilidade "),
              isExpanded: true,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 13,
                ),
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                icon: Icon(
                  Icons.event_available,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              onChanged: (val) {
                ctrl.switchAvailableVal(val.toString());
              },
              items: available
                  .map((op) => DropdownMenuItem(
                        child: Text(op),
                        value: op,
                      ))
                  .toList(),
              value: (ctrl.availableVal.isEmpty) ? null : ctrl.availableVal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              onTap: () => scan(),
              style: const TextStyle(
                fontFamily: "Jost",
                fontSize: 12,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                labelText: ctrl.serialLink,
                labelStyle: TextStyle(color: Colors.black),
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
          ),
          TextField(
            controller: ScanController.state_ctrl,
            style: const TextStyle(
              fontFamily: "Jost",
              fontSize: 12,
            ),
            decoration: InputDecoration(
              hintText: "Descrição do item",
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              icon: Icon(
                Icons.folder_copy_rounded,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          Center(
              child: Image.asset(
            "assets/ncaicon.png",
            height: 250,
            width: 250,
          )),
        ],
      ),
    );
  }

  void scan() async {
    log("BODYSCAN");
    String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        "#ff0d11", "Cancel", true, ScanMode.BARCODE);
    ctrl.setHint = barcodeScan;
  }
}
