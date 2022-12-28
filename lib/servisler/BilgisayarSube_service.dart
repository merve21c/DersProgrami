import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/BilgisayarSubeAcBtn.dart';

class BilgisayarSubeService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<BilgisayarSubeAcBtn> addBilgisayarSubeAc(String sube, String text) async {
    var ref = _firestore.collection(
        "Bilgisayar Sube"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'sube':sube,
    });
    return BilgisayarSubeAcBtn();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getBilgisayarSubeAc() {
    var ref = _firestore.collection("Bilgisayar Sube").snapshots();
    return ref;
  }

  //veriyi silmek için
  Future<void> removeBilgisayarSubeAc(String docId) {
    var ref = _firestore.collection("Bilgisayar Sube").doc(docId).delete();

    return ref;
  }
}