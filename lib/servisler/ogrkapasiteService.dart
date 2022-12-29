import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/%C3%96kapasite.dart';

class kapasiteService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<Okapasite> addOgrkapasiteEkle( String kapasite , String text) async {
    var ref = _firestore.collection(
        "öğrenci kapasite"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'kapasite':kapasite,
    });
    return Okapasite();
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getOgrkapasiteEkle() {
    var ref = _firestore.collection("öğrenci kapasite").snapshots();
    return ref;
  }
  //veriyi silmek için
  Future<void> removeOgrkapasiteEkle(String docId) {
    var ref = _firestore.collection("öğrenci kapasite").doc(docId).delete();

    return ref;
  }
}

