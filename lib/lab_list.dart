import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/servisler/Labekle_service.dart';
import 'package:flutter/material.dart';

class lablist extends StatefulWidget {
  @override
  _lablistState createState() => _lablistState();
}

class _lablistState extends State<lablist> {
LabekleService _labekleService =LabekleService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _labekleService.getLabekle(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot mypost = snapshot.data!.docs[index];

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
                                      _labekleService
                                          .removeLabekle(mypost.id);
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
                    height: size.height * .1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${mypost['laboratuvar']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
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
