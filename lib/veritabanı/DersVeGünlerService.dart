import 'package:cloud_firestore/cloud_firestore.dart';

import '../Kullanıcı/DersVeMüsaitGün.dart';

class DersVeGunService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<DersVeMusaitGun> addDersVeGun(
      String OgretimUyesi,
      String DrOgretimUyesi,
      String Pazartesi,
      String Sali,
      String Carsamba,
      String Persembe,
      String Cuma,
      String Nesne ,
      String Programlama,
      String Mobil,
      String Gorsel,
      String Veri,
      )async {
    var ref = _firestore.collection(
        "Kullanıcı"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'OgretimUyesi':OgretimUyesi,
      'DrOgretimUyesi':DrOgretimUyesi,
      'Pazartesi': Pazartesi,
      'Sali': Sali,
      'Carsamba': Carsamba,
      'Persembe': Persembe,
      'Cuma': Cuma,

      'Nesne': Nesne,
      'Programlama': Nesne,
      'Mobil': Mobil,
      'Gorsel': Gorsel,
      'Veri': Veri,

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