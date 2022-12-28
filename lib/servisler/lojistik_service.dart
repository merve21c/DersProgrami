import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/Lojistik.dart';

class LojistikService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Lojistik> addLojistikDersPekle(String bolumadiID ,String gun, String dersadi,String dersOgretmeni,String dersSaati,String amfi, String text) async {
    var ref = _firestore.collection(
        "Lojistik Ders Programı"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'bolumadiID':bolumadiID,
      'gun':gun,
      'dersadi':dersadi,
      'dersOgretmeni':dersOgretmeni,
      'dersSaati':dersSaati,
      'amfi':amfi,
    });
    return Lojistik();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getLojistikDersPekle() {
    var ref = _firestore.collection("Lojistik Ders Programı").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeLojistikDersPekle(String docId) {
    var ref = _firestore.collection("Lojistik Ders Programı")
        .doc(docId)
        .delete();

    return ref;
  }
}