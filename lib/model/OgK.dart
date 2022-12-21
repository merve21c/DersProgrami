import 'package:cloud_firestore/cloud_firestore.dart';
//model sınıfı
class OgK {
  // ekleyeceğimiz veriler
  String Oad;
  String gun ;
  String ders;

  OgK({required this.Oad,required this.gun, required this.ders});

  factory OgK.fromSnapshot(DocumentSnapshot snapshot) { //dokumant snapshot formatında eşitliyoruz
    return OgK(
      Oad: snapshot["Oad"],
      gun: snapshot["gun"],
      ders: snapshot["ders"],
    );
  }
}