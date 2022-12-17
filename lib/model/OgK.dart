import 'package:cloud_firestore/cloud_firestore.dart';
//model sınıfı
class OgK {
  // ekleyeceğimiz veriler
  String gun ;
  String ders;

  OgK({required this.gun, required this.ders});

  factory OgK.fromSnapshot(DocumentSnapshot snapshot) { //dokumant snapshot formatında eşitliyoruz
    return OgK(
      gun: snapshot["gun"],
      ders: snapshot["ders"],
    );
  }
}