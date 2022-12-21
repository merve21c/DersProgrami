import 'package:cloud_firestore/cloud_firestore.dart';
//model sınıfı
class Dekle {
  // ekleyeceğimiz veriler

 String dersId;
 String dersadi;
 String dersSaat;

  Dekle({required this.dersId, required this.dersadi, required this.dersSaat});

  factory Dekle.fromSnapshot(DocumentSnapshot snapshot) { //dokumanı snapshot formatında eşitliyoruz
    return Dekle(
      dersId: snapshot["dersId"],
      dersadi: snapshot["dersadi"],
      dersSaat: snapshot["dersSaat"],
    );
  }
}