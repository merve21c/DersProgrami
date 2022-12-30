import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Kaynak/String.dart';
import 'package:dersprogrami/Sabitler/Bekleme_Sayfas%C4%B1.dart';
import 'package:dersprogrami/veritaban%C4%B1/Unvan_Service.dart';
import 'package:flutter/material.dart';

class EkleUnvanList extends StatefulWidget {
  const EkleUnvanList({Key? key}) : super(key: key);

  @override
  State<EkleUnvanList> createState() => _EkleUnvanListState();
}

class _EkleUnvanListState extends State<EkleUnvanList> {
  UnvanService _unvanService=UnvanService();
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  StreamBuilder _body() {
    return StreamBuilder<QuerySnapshot>(
      stream: _unvanService.getUnvan(),
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
                                  _unvanService
                                      .removeUnvan(mypost.id);
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
                          )
                      )
                  );
                }
            );
          }


          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                _showChoiseDialog(context);
              },
              child: _dersListContainer(mypost),
            ),
          );
        });
  }

  Container _dersListContainer(DocumentSnapshot mypost) {
    return Container(
      decoration: BoxDecoration(
        color: KullaniciColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: _dersListColumn(mypost),
    );
  }

  Padding _dersListColumn(DocumentSnapshot mypost) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KullaniciText.dersList,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${mypost['unvan']}",
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
     );
    }
  }

