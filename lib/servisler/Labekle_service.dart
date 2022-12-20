import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/Labekle.dart';

class LabekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Labekle> addLabekle(String laboratuvar , String text) async {
    var ref = _firestore.collection(
        "Laboratuvar"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'laboratuvar':laboratuvar,
    });
    return Labekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getLabekle() {
    var ref = _firestore.collection("Şubeler").snapshots();
    return ref;
  }
}