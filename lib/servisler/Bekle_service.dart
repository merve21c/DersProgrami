import 'package:cloud_firestore/cloud_firestore.dart';

import '../ekle_sil/Bekle.dart';

class BekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Bekle> addBekle(String bolumadi , String text) async {
    var ref = _firestore.collection(
        "Şubeler"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

     'bolumadi':bolumadi,
    });
    return Bekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getBekle() {
    var ref = _firestore.collection("Şubeler").snapshots();
    return ref;
  }
}