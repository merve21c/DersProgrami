import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/drslkekle.dart';

class derslikekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<derslikekle> addderslikekle(String derslik , String text) async {
    var ref = _firestore.collection(
        "Derslik"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'derslik':derslik,
    });
    return derslikekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getderslikekle() {
    var ref = _firestore.collection("Şubeler").snapshots();
    return ref;
  }
}