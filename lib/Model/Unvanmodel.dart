import 'package:cloud_firestore/cloud_firestore.dart';

class Unvan{
  String id;
  String unvan;
  Unvan({required this.id, required this.unvan});
  factory Unvan.fromSnapshot(DocumentSnapshot snapshot) {
    return Unvan(
      id: snapshot.id,
      unvan: snapshot["Unvan"],
    );
  }
}