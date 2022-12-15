
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/model/Oekle.dart';

class OekleService{
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
 Future<Oekle> addOekle(String adisoyadi , String unvan , String ders, String text)async{
  var ref = _firestore.collection("Öğretmenler");  //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({

    'adisoyadi':adisoyadi,
    'unvan':unvan,
    'ders':ders

  });
  return Oekle( adisoyadi: adisoyadi, unvan: unvan, ders: ders);

 }

 //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
 Stream<QuerySnapshot> getOekle(){
 var ref = _firestore.collection("Öğretmenler").snapshots();
 return ref;
 }


  //status silmek için
  Future<void> removeOekle(String docId) {
    var ref = _firestore.collection("Öğretmenler").doc(docId).delete();

    return ref;
  }
}