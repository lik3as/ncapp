import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget{
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("ESCANEAR"),),
      ),
    );
  }

}