import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/Dekle.dart';

class DekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Dekle> addDekle(String dersId, String dersadi,String dersSaati ,String text) async {
    var ref = _firestore.collection(
        "Ders Bilgileri"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'dersId':dersId,
      'dersadi':dersadi,
      'dersSaati':dersSaati
    });
    return Dekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getDekle() {
    var ref = _firestore.collection("Ders Bilgileri").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeDekle(String docId) {
    var ref = _firestore.collection("Ders Bilgileri").doc(docId).delete();

    return ref;
  }
}