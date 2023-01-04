import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/veritaban%C4%B1/DersVeG%C3%BCnlerService.dart';
import 'package:flutter/material.dart';

class DersVeMusaitGunList extends StatefulWidget {
  const DersVeMusaitGunList({Key? key}) : super(key: key);

  @override
  State<DersVeMusaitGunList> createState() => _DersVeMusaitGunListState();
}

class _DersVeMusaitGunListState extends State<DersVeMusaitGunList> {
DersVeGunService _dersVeGunService = DersVeGunService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _dersVeGunService.getDersVeGun(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (checkbox, index) {
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
                                     _dersVeGunService
                                          .removeDersVeGun(mypost.id);
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
                        color: KullaniciColors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${mypost['Pazartesi']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Text( "${mypost['Salı']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),

                       Text( "${mypost['Carsamba']}",
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

