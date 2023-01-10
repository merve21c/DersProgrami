import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/veritaban%C4%B1/EklemeService.dart';
import 'package:flutter/material.dart';

import '../Kaynak/Renkler.dart';
import '../Kaynak/String.dart';
import '../Sabitler/Bekleme_Sayfası.dart';

class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  EkleService _ekleService= EkleService();
  @override
  Widget build(BuildContext context) {
    return _body();
  }


  StreamBuilder _body() {
    return StreamBuilder<QuerySnapshot>(
      stream: _ekleService.getProgram(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? const BeklemeSayfasi()
            : snaphot.data != null
            ? _mainBody(snaphot)
            : const BeklemeSayfasi();
      },
    );
  }

  ListView _mainBody(AsyncSnapshot<QuerySnapshot<Object?>> snaphot) {
    return ListView.builder(
        itemCount: snaphot.data?.docs.length ?? 0,
        itemBuilder: (context, index) {
          DocumentSnapshot mypost = snaphot.data!.docs[index];
          Future<void> _showChoiseDialog(BuildContext context) {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text(
                        "Program Silinsin Mi ?",
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
                                  _ekleService
                                      .removeProgram(mypost.id);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Sil",
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
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                _showChoiseDialog(context);
              },

              child: _ProgramlistContainer(mypost),
            ),
          );
        }
    );
  }

  Container _ProgramlistContainer(DocumentSnapshot mypost) {
    return Container(
      decoration: BoxDecoration(
        color: KullaniciColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: _ProgramListColumn(mypost),
    );
  }

  Padding _ProgramListColumn(DocumentSnapshot mypost) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KullaniciText.Program2Text,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["adsoyad"]
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
              mypost["Unvan"]   ?? "Dr.Öğretim Üyesi : "
          ),
          const SizedBox(
            height: 10,
          ),

          Text(
              mypost["Ders"]
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Lab"]
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Saat"]
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Sube"]
          ),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}

