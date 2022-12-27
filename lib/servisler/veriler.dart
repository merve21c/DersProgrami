import 'package:cloud_firestore/cloud_firestore.dart';
import '../ekle_sil/veriekle.dart';

class VeriekleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Veriekle> addVeriekle(String dersId, String dersadi,String dersSaati ,String bolumadiID ,
      String gun,String dersOgretmeni,String unvan,String laboratuvar,String amfi,String derslik,String text) async {
    var ref = _firestore.collection(
        "Veriler"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'bolumadiID':bolumadiID,
      'gun':gun,
      'dersadi':dersadi,
      'dersOgretmeni':dersOgretmeni,
      'unvan':unvan,
      'dersSaati':dersSaati,
      'dersId':dersId,
      'amfi':amfi,
      'derslik':derslik,
      'laboratuvar':laboratuvar,
    });
    return Veriekle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getVeriekle() {
    var ref = _firestore.collection("Veriler").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeVeriekle(String docId) {
    var ref = _firestore.collection("Veriler").doc(docId).delete();

    return ref;
 }
}

