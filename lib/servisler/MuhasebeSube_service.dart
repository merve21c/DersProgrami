import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/MuhasebeSubeAcBtn.dart';

class MuhasebeSubeService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<MuhasebeSubeAcBtn> addMusabeSubeAc(String sube, String text) async {
    var ref = _firestore.collection(
        "Muhasebe Sube"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'sube':sube,
    });
    return MuhasebeSubeAcBtn();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getMuhasebeSubeAc() {
    var ref = _firestore.collection("Muhasebe Sube").snapshots();
    return ref;
  }

  //veriyi silmek için
  Future<void> removeMuhasebeSubeAc(String docId) {
    var ref = _firestore.collection("Muhasebe Sube").doc(docId).delete();

    return ref;
  }
}