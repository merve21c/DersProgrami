import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/model/Oekle.dart';

class OekleService{
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// veri ekleme fonksiyonu
 Future<Oekle> addOekle(String adisoyadi , String ders , String unvan, String id, String text)async{
  var ref = _firestore.collection("Öğretmenler");  //koleksiyonumuzun ismini yazıyoruz .
  var documentRef = await ref.add({

      'adisoyadi':adisoyadi,
      'ders':ders,
      'unvan':unvan,


  });
  return Oekle(id : documentRef.id,adisoyadi: adisoyadi,ders: ders,unvan: unvan);

 }

 //veri gösterme fonksiyonu
  //sayfadaki verilerin anlık değişimini göstermek için stream kullanıyoruz
 Stream<QuerySnapshot> getOekle(){
 var ref = _firestore.collection("Öğretmenler").snapshots();
 return ref;
 }


  //veriyi silmek için
  Future<void> removeOekle(String docId) {
    var ref = _firestore.collection("Öğretmenler").doc(docId).delete();

    return ref;
  }

}