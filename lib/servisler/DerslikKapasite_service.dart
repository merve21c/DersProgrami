import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/ekle_sil/DerslikKapasiteEkle.dart';

class DerslikKapasiteService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<DerslikKapasiteEkle> addDerslikKapasiteEkle( String kapasite , String text) async {
    var ref = _firestore.collection(
        "Derslik Kapasite"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'kapasite':kapasite,
    });
    return DerslikKapasiteEkle();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getDerslikKapasiteEkle() {
    var ref = _firestore.collection("Derslik Kapasite").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeDerslikKapasiteEkle(String docId) {
    var ref = _firestore.collection("Derslik Kapasite").doc(docId).delete();

    return ref;
  }
}
