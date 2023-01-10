import 'package:dersprogrami/%C5%9EubeBilgileri/%C5%9Eubeler.dart';

class SubeKapasiteAnaSayfa extends Cubit<List<sube>>{
  SubeKapasiteAnaSayfa():super(<sube>[]);

  var OgrenciDepo = OgrenciDepo();
  var subebilgi = FirebaseDatabase.instance.ref().child('sube');

  Future<void> kisileriYukle() async {
    subebilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <sube>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = sube.fromJson(key, nesne);
          liste.add(kisi);
        });

        emit(liste);
      }
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    subebilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <sube>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = sube.fromJson(key, nesne);
          if (kisi.subead.toLowerCase().contains(aramaKelimesi.toLowerCase())){
            liste.add(kisi);
          }

        });


        emit(liste);
      }
    });
  }

  Future<void> sil(String kisi_id) async {
    subebilgi.child(kisi_id).remove();
  }
}