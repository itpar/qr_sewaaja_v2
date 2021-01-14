import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrscanner/models.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final String code;

  Detail(this.code);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Mobildata mobildata;

  Future<Mobildata> getMobil() async {
    await http
        .get(
            "http://par-mobile.com/sewaaja/api-scaner/readImageText.php?refNumberQrCode=${widget.code}")
        .then((response) {
      if (jsonDecode(response.body) != null) {
        setState(() {
          mobildata = Mobildata.fromJson(jsonDecode(response.body));
        });
      }
    });
    return mobildata;
  }

  @override
  void initState() {
    // TODO: implement initState
    getMobil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: mobildata == null
            ? Text(
                " Mobil Tidak Ditemukan,  ${widget.code}",
                style: TextStyle(fontSize: 20.0),
              )
            : Container(
                child: Column(
                  children: [
                    Text(
                      "id : ${mobildata.id}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Nomor Polisi : ${mobildata.noPolisi}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Nomor Rangka : ${mobildata.noRangka}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Nomor Mesin : ${mobildata.noMesin}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Keterangan : ${mobildata.keterangan}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Status : ${mobildata.status}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Numer Qr Code : ${mobildata.refNumberQrCode}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
