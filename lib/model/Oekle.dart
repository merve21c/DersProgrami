import 'package:cloud_firestore/cloud_firestore.dart';
 //model sınıfı
class Oekle {
  // ekleyeceğimiz veriler

  String adisoyadi;
  String unvan;
  String ders;

  Oekle({required this.adisoyadi, required this.unvan, required this.ders});

  factory Oekle.fromSnapshot(DocumentSnapshot snapshot) { //dokumant snapshot formatında eşitliyoruz
    return Oekle(
      adisoyadi: snapshot["adisoyadi"],
      unvan: snapshot["unvan"],
      ders: snapshot["ders"],
    );
  }
}