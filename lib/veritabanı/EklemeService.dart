import 'package:dersprogrami/Yonetici/ProgramE.dart';

class EkleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Program> addProgram(String adsoyad,String Unvan,String Ders,String Lab,String Saat ) async {
    var ref =
        _firestore.collection("Öğretmen"); //koleksiyonumuzun ismini yazıyoruz .
    await ref.add({
      'adsoyad': adsoyad,
      'Unvan':Unvan,
      'Ders':Ders,
      'Lab':Lab,
      'Saat':Saat,
    });
    return Program();
  }

  Stream<QuerySnapshot> getProgram() {
    var ref = _firestore.collection("Öğretmen").snapshots();
    return ref;
  }

  Future<void> removeProgram(String docId) {
    var ref = _firestore.collection('Öğretmen').doc(docId).delete();

    return ref;
  }
}
