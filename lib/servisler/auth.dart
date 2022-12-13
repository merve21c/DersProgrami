import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User?> createKullanici(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Kullanıcı")     //yeni kayıt yaparken kullanıcı bilgilerini veri tabanına ekler.
        .doc(user.user!.uid)
        .set({'userName': name, 'email': email});

    return user.user;
  }


  Future<User?> Oekle( adisoyadi,  unvan,  ders) async {
  var user;
  await _firestore
      .collection("Öğretmen")     //yeni kayıt yaparken kullanıcı bilgilerini veri tabanına ekler.
      .doc(user.user!.uid)
      .set({'adısoyadı': adisoyadi,'ünvan':unvan ,'ders': ders });


  }
  }


