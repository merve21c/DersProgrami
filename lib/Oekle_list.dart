import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/servisler/Oekle_service.dart';
import 'package:flutter/material.dart';

class Oeklelist extends StatefulWidget {
  @override
  _OeklelistState createState() => _OeklelistState();
}

class _OeklelistState extends State<Oeklelist> {
  OekleService _oekleService = OekleService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _oekleService.getOekle(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: snaphot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot mypost = snaphot.data!.docs[index];

              Future<void> _showChoiseDialog(BuildContext context) {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text(
                            "Silmek istediğinize emin misiniz?",
                            textAlign: TextAlign.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0))),
                          content: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      _oekleService
                                          .removeOekle(mypost.id);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Evet",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Vazgeç",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )));
                    });
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _showChoiseDialog(context);
                  },
                  child: Container(
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${mypost['ÖĞRETMEN']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}