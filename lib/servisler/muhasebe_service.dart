import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/MuhasebeDersePkle.dart';

class MuhasebeService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<MuhasebeDersP> addMuhasebeDersPekle(String bolumadiID ,String gun, String dersadi,String dersOgretmeni,String dersSaati,String amfi, String text) async {
    var ref = _firestore.collection(
        "Muhasebe Ders Programı"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'bolumadiID':bolumadiID,
      'gun':gun,
      'dersadi':dersadi,
      'dersOgretmeni':dersOgretmeni,
      'dersSaati':dersSaati,
      'amfi':amfi,
    });
    return MuhasebeDersP();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getMuhasebeDersPekle() {
    var ref = _firestore.collection("Muhasebe Ders Programı").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeMuhasebeDersPekle(String docId) {
    var ref = _firestore.collection("Muhasebe Ders Programı").doc(docId).delete();

    return ref;
  }
}
