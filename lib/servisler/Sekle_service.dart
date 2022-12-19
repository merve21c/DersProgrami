import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/Sekle.dart';

class SekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Sekle> addSekle(String derslik, String laboratuvar,String amfi ,String text) async {
    var ref = _firestore.collection(
        "Şubeler"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'derslik':derslik,
      'laboratuvar':laboratuvar,
      'amfi':amfi
    });
    return Sekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getSekle() {
    var ref = _firestore.collection("Şubeler").snapshots();
    return ref;
  }
}