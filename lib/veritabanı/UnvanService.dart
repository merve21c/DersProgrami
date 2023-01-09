
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Kullanıcı/DersVeMüsaitGün.dart';

class UnvanService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<DersVeMusaitGun> addUnvan(
      String OgretimUyesi,
      String DrOgretimUyesi,
      )async {
    var ref = _firestore.collection(
        "Kullanıcı"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'OgretimUyesi':OgretimUyesi,
      'DrOgretimUyesi':DrOgretimUyesi,
    });
    return DersVeMusaitGun();
  }


  Stream<QuerySnapshot> getDersVeGun() {
    var ref = _firestore.collection("Kullanıcı").snapshots();
    return ref;
  }
  Future<void> removeDersVeGun(String docId) {
    var ref = _firestore.collection('Kullanıcı').doc(docId).delete();

    return ref;

  }
}