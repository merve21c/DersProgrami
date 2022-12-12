import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class kbilgileri {

  final FirebaseFirestore_firestore=FirebaseFirestore.instance;

  addkbilgileri(String kbilgileri,String image) async {

    var _firestore;
    var ref = _firestore.collection("kbilgileri");

    var documentRef = await ref.add({

      kbilgileri : kbilgileri,
      image : image

    });
    return kbilgileri ;
  }



}