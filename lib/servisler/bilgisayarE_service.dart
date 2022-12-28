import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/BilgisayarDersPekle.dart';

class BilgisayarService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<BilgisayarDersP> addBilgisayarDersPekle(String bolumadiID ,String gun, String dersadi,String dersOgretmeni,String dersSaati,String amfi, String text) async {
    var ref = _firestore.collection(
        "Bilgisayar Ders Programı"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'bolumadiID':bolumadiID,
      'gun':gun,
      'dersadi':dersadi,
      'dersOgretmeni':dersOgretmeni,
      'dersSaati':dersSaati,
      'amfi':amfi,
    });
    return BilgisayarDersP();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getBilgisayarDersPekle() {
    var ref = _firestore.collection("Bilgisayar Ders Programı").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeBilgisayarDersPekle(String docId) {
    var ref = _firestore.collection("Bilgisayar Ders Programı").doc(docId).delete();

    return ref;
  }
}