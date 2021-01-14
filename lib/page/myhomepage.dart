import 'package:flutter/material.dart';
import 'package:qrscanner/main.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrscanner/page/detail.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  String code = '';
//  String getcode = '';

  Future scanbarcode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#009922", "CANCEL", true, ScanMode.DEFAULT)
        .then((String refNumberQrCode) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Detail(refNumberQrCode)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("Qr Scanner"),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              child: Text(
                "Scan Barcode",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                scanbarcode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
