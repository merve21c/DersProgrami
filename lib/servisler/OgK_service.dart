import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/Kullanici/OgK.dart';

class OgKService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
  Future<OgK> addOgK( String Oadi ,String gun,  String ders, String text) async {
    var ref = _firestore.collection(
        "Ders ve Günler"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'Oadi':Oadi,
      'gun': gun,
      'ders': ders
    });
    return OgK( Oadi: Oadi,gun : gun , ders : ders );
  }

  //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
  Stream<QuerySnapshot> getOgK() {
    var ref = _firestore.collection("Ders ve Günler").snapshots();
    return ref;
  }
}