import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/Unvanmodel.dart';

class UnvanService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Unvan> addUnvan(String unvan) async {
    var ref = _firestore.collection("Unvan");

    var documentRef = await ref.add({'unvan':unvan });

    return Unvan(id: documentRef.id, unvan: unvan);
  }

  Stream<QuerySnapshot> getUnvan() {
    var ref = _firestore.collection("Unvan").snapshots();

    return ref;
  }

  Future<void> removeUnvan(String docId) {
    var ref = _firestore.collection("Unvan").doc(docId).delete();

    return ref;
  }
}