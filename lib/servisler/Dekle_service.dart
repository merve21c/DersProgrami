import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/Dekle.dart';

class DekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Dekle> addDekle(int dersId, String dersadi,int dersSaati ,String text) async {
    var ref = _firestore.collection(
        "Ders Bilgileri"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'dersId':dersId,
      'dersadi':dersadi,
      'dersSaati':dersSaati
    });
    return Dekle(dersId:dersId , dersadi:dersadi,dersSaati:dersSaati );
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getDekle() {
    var ref = _firestore.collection("Ders Bilgileri").snapshots();
    return ref;
  }
}