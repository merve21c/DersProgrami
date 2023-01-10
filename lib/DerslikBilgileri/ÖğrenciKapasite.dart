import 'package:dersprogrami/DerslikBilgileri/%C3%96%C4%9Frenci.dart';

class OgrenciKapasite extends Cubit<List<DerslikKapasite>>{
  OgrenciKapasite():super(<DerslikKapasite>[]);

  var OgrenciDepo = OgrencikapasiteDepo();
  var DerslikBilgi = FirebaseDatabase.instance.ref().child('kisiler');

  Future<void> kisileriYukle() async {
    DerslikBilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <DerslikKapasite>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = DerslikKapasite.fromJson(key, nesne);
          liste.add(kisi);
        });

        emit(liste);
      }
    });
  }

  Future<void> ara(String AramaKelimesi) async {
   DerslikBilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <DerslikKapasite>[];

        gelenDegerler.forEach((key,nesne){
          var Ogrenci =DerslikKapasite.fromJson(key, nesne);
          if (Ogrenci.derslik.toLowerCase().contains(AramaKelimesi.toLowerCase())){
            liste.add(Ogrenci);
          }
        });

        emit(liste);
      }
    });
  }

  Future<void> sil(String kisi_id) async {
    DerslikBilgi.child(kisi_id).remove();
  }
}