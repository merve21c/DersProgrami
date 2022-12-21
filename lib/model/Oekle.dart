import 'package:cloud_firestore/cloud_firestore.dart';
 //model sınıfı
class Oekle {
  // ekleyeceğimiz veriler

  String adisoyadi;
  String ders;
  String unvan;
  String id;

  Oekle({required this.adisoyadi, required this.ders, required this.unvan, required this.id});

  factory Oekle.fromSnapshot(DocumentSnapshot snapshot) { //dokumanı snapshot formatında eşitliyoruz
    return Oekle(
      adisoyadi: snapshot["adisoyadi"],
      ders: snapshot["ders"],
      unvan: snapshot["unvan"],
      id: snapshot["id"],
    );
  }
}