import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Kaynak/String.dart';
import 'package:dersprogrami/Sabitler/Bekleme_Sayfas%C4%B1.dart';
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
                  return _alertDialog(mypost);
                });
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                _showChoiseDialog(context);
              },
              child: _dersvegunlistContainer(mypost),
            ),
          );
        });
  }

  Container _dersvegunlistContainer(DocumentSnapshot mypost) {
    return Container(
      decoration: BoxDecoration(
        color: KullaniciColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: _dietListColumn(mypost),
    );
  }

  Padding _dietListColumn(DocumentSnapshot mypost) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KullaniciText.sayfaText,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),

          Text(
              mypost["Pazartesi"] == "true" ? "Pazartesi" : "Boş"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            mypost["Sali"] == "true" ? "Salı" : "Boş"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            mypost["Carsamba"] == "true" ? "Çarşamba" : "Boş"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Persembe"] == "true" ? "Perşembe" : "Boş"
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Cuma"] == "true" ? "Cuma" : "Boş"

          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              mypost["Nesne"] == "true" ? "Nesne" : "Boş"
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

AlertDialog _alertDialog(DocumentSnapshot mypost) {
  return AlertDialog(
    title: Text(
      KullaniciText.alertDialogTitle,
      textAlign: TextAlign.center,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    content: _alertDialogContent(mypost),
  );
}

Row _alertDialogContent(DocumentSnapshot mypost) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[],
  );
}
