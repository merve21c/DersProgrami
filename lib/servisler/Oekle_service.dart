import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class OekleService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> Oekle( adisoyadi,  unvan,  ders) async {
    var user;
    await _firestore
        .collection("Öğretmen")     //yeni kayıt yaparken kullanıcı bilgilerini veri tabanına ekler.
        .doc(user.user!.uid)
        .set({'adısoyadı': adisoyadi,'ünvan':unvan ,'ders': ders });


  }
}
