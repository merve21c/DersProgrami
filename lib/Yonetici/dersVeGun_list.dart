import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Kaynak/String.dart';
import 'package:dersprogrami/Sabitler/Bekleme_Sayfas%C4%B1.dart';
import 'package:dersprogrami/Yonetici/UnvanEkle.dart';
import 'package:dersprogrami/veritaban%C4%B1/DersVeG%C3%BCnlerService.dart';
import 'package:flutter/material.dart';

class YDersVeMusaitGunlist extends StatefulWidget {
  const YDersVeMusaitGunlist({Key? key}) : super(key: key);

  @override
  State<YDersVeMusaitGunlist> createState() => _YDersVeMusaitGunlistState();
}

class _YDersVeMusaitGunlistState extends State<YDersVeMusaitGunlist> {
  DersVeGunService _dersVeGunService = DersVeGunService();


  @override
  Widget build(BuildContext context) {
    return _body();
  }


  StreamBuilder _body() {
    return StreamBuilder<QuerySnapshot>(
      stream: _dersVeGunService.getDersVeGun(),
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
                        "Ünvan eklensin mi ?",
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
                                  Navigator.push(  context,
                                    MaterialPageRoute(builder: (context) => const UnvanEkle()));
                                },
                                child: Text(
                                  "Ekle",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _dersVeGunService
                                      .removeDersVeGun(mypost.id);
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

              child: _ydersvegunlistContainer(mypost),
            ),
          );
        }
        );
  }

  Container _ydersvegunlistContainer(DocumentSnapshot mypost) {
    return Container(
      decoration: BoxDecoration(
        color: KullaniciColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: _ydersvegunListColumn(mypost),
    );
  }

  Padding _ydersvegunListColumn(DocumentSnapshot mypost) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KullaniciText.MustafaText,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["OgretimUyesi"] == "true" ? "Öğretim Üyesi " : ""
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["DrOgretimUyesi"] == "true" ? "Dr.Öğretim Üyesi " : ""
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Müsait Günler"),
          const SizedBox(
            height: 20,
          ),


          Text(
              mypost["Pazartesi"] == "true" ? "Pazartesi " : " Pazartesi Dolu"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Sali"] == "true" ? "Salı" : " Salı Dolu"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Carsamba"] == "true" ? "Çarşamba" : " Çarşamba Dolu"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Persembe"] == "true" ? "Perşembe" : " Perşembe Dolu"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Cuma"] == "true" ? "Cuma" : " Cuma Dolu"

          ),
          const SizedBox(
            height: 40,
          ),
          Text(" Aldığı Dersler"),
          const SizedBox(
            height: 20,
          ),
          Text(
              mypost["Nesne"] == "true" ? "Nesne Yönelimli Programlama" : ""
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Programlama"] == "true" ? "Programlama Temelleri" : ""
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Mobil"] == "true" ? "Mobil Programlama" : ""
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Gorsel"] == "true" ? "Gorsel Programlama" : ""
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Veri"] == "true" ? "Veri Yapıları" : ""
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
