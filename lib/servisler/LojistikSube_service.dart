import 'package:cloud_firestore/cloud_firestore.dart';

import '../ekle_sil/LojistikSubeAcBtn.dart';

class LojistikSubeService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<LojistikSubeAcBtn> addLojistikSubeAc(String sube, String text) async {
    var ref = _firestore.collection(
        "Lojistik Sube"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'sube':sube,
    });
    return LojistikSubeAcBtn();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getLojistikSubeAc() {
    var ref = _firestore.collection("Lojistik Sube").snapshots();
    return ref;
  }

  //veriyi silmek için
  Future<void> removeLojistikSubeAc(String docId) {
    var ref = _firestore.collection("Lojistik Sube").doc(docId).delete();

    return ref;
  }
}