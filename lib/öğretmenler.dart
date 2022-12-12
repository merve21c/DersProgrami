import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/kullanici.dart';
import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';
class ogretmenler extends StatefulWidget {
  const ogretmenler({Key? key}) : super(key: key);

  @override
  State<ogretmenler> createState() => _ogretmenlerState();
}

class _ogretmenlerState extends State<ogretmenler> {
TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();
TextEditingController t3 = TextEditingController();

  var resizeToAvoidBottomPadding;


 oEkle(){
   FirebaseFirestore.instance
       .collection("ogretmenler")
       .doc(t1.text)
       .set({'isim':t1.text, 'soyad':t2.text, 'unvan': t3.text})
       .whenComplete(() => print("öğretmen eklendi.")) ;

}

oGuncelle(){
  FirebaseFirestore.instance
      .collection("ogretmenler")
      .doc(t1.text)
      .update({'isim':t1.text, 'soyad':t2.text, 'unvan': t3.text})
      .whenComplete(() => print("öğretmen güncellendi.")) ;

}

oSil(){
  FirebaseFirestore.instance
      .collection("ogretmenler")
      .doc(t1.text)
      .delete()
      .whenComplete(() => print("yazı eklendi.")) ;

}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.people_alt,
                    color: Colors.grey,
                    size: 50.0,
                  ),
                  Text(
                    "ÖĞRETMENLER",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                  SizedBox(
                   height: 100,
                    child:   ListTile(
                      title: Text('geri dön'),
                      trailing: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>yonetici()));
                      },
                    ),
                  ),

                  Row(children: [
                    ElevatedButton(
                      child: Text('Ekle'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => kullanici())); //ekle
                      },
                    ),
                    ElevatedButton(
                      child: Text('Güncelle'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => kullanici())); //güncelle
                      },
                    ),
                    ElevatedButton(
                      child: Text('Sil'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => kullanici())); //sil
                      },
                    ),
                  ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



