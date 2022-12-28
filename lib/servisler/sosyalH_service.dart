import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/SosyalHDersPekle.dart';

class SosyalHService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<SosyalHDersP> addSosyalHDersP(String bolumadiID ,String gun, String dersadi,String dersOgretmeni,String dersSaati,String amfi, String text) async {
    var ref = _firestore.collection(
        "Sosyal Hizmet Ders Programı"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'bolumadiID':bolumadiID,
      'gun':gun,
      'dersadi':dersadi,
      'dersOgretmeni':dersOgretmeni,
      'dersSaati':dersSaati,
      'amfi':amfi,
    });
    return SosyalHDersP();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getSosyalHDersP() {
    var ref = _firestore.collection("Sosyal Hizmet Ders Programı").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeSosyalHDersP(String docId) {
    var ref = _firestore.collection("Sosyal Hizmet Ders Programı").doc(docId).delete();

    return ref;
  }
}
