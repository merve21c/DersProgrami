import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/servisler/Oekle_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Oekle extends StatefulWidget {
  const Oekle({Key? key}) : super(key: key);

  @override
  State<Oekle> createState() => _OekleState();
}

class _OekleState extends State<Oekle> {
  final TextEditingController _adisoydiController = TextEditingController();
  final TextEditingController _unvanController = TextEditingController();
  final TextEditingController _dersController = TextEditingController();
  final TextEditingController OekleController = TextEditingController();
  OekleService _oekleService = OekleService();
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğretmen ekle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
    height: size.height * .4,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextField(
            controller: _adisoydiController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "Ad Soyad",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            )),
              TextField(
                  controller: _unvanController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Unvan",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  )),
              TextField(
                  controller: _dersController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Ders Adı",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  )),
    Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
    child: InkWell(
    onTap: () {
   _oekleService
        .addOekle(_adisoydiController.text , _unvanController.text , _dersController.text ,'')
        .then((value) {
    Fluttertoast.showToast(
    msg: "Öğretmen eklendi!",
    timeInSecForIosWeb: 5,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey[600],
    textColor: Colors.white,
    fontSize: 14);
    Navigator.pop(context);
    });
    },
    child: Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.blue, width: 2),
    //color: colorPrimaryShade,
    borderRadius: BorderRadius.all(Radius.circular(30))),
    child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Center(
    child: Text(
    "Ekle",
    style: TextStyle(
    color: Colors.blue,
    fontSize: 20,
    ),
    )),
    ),
    ),
    ),
    ),
    ],




    ),
      ),
      ),
          ),
        ],
      ),
    );
  }
}