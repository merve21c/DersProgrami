import 'package:cloud_firestore/cloud_firestore.dart';

import '../ekle_sil/Aekle.dart';

class AmfiekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Amfiekle> addAmfiekle(String amfi , String text) async {
    var ref = _firestore.collection(
        "Amfi"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'amfi':amfi,
    });
    return Amfiekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getAmfiekle() {
    var ref = _firestore.collection("Amfi").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeAmfiekle(String docId) {
    var ref = _firestore.collection("Amfi").doc(docId).delete();

    return ref;
  }
}