import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/SubeAc.dart';

class SubeAcService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<SubeAc> addSubeAc(String sube, String text) async {
    var ref = _firestore.collection(
        "Subeler"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

      'sube':sube,
    });
    return SubeAc();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getSubeAc() {
    var ref = _firestore.collection("Subeler").snapshots();
    return ref;
  }

  //veriyi silmek için
  Future<void> removeSubeAc(String docId) {
    var ref = _firestore.collection("Subeler").doc(docId).delete();

    return ref;
  }
}