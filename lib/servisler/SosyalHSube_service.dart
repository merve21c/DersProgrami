import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/SosyalHSubeAcBtn.dart';

class SosyalHSubeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<SosyalHSubeAcBtn> addSosyalHSubeAc(String sube, String text) async {
    var ref = _firestore.collection(
        "Sosyal Hizmet Sube"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'sube':sube,
    });
    return SosyalHSubeAcBtn();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getSosyalHSubeAc() {
    var ref = _firestore.collection("Sosyal Hizmet Sube").snapshots();
    return ref;
  }

  //veriyi silmek için
  Future<void> removeSosyalHSubeAc(String docId) {
    var ref = _firestore.collection("Sosyal Hizmet Sube").doc(docId).delete();

    return ref;
  }
}