class OgretmenKapasite extends Cubit<List<Kisiler>>{
  OgretmenKapasite():super(<Kisiler>[]);

  var krepo = KisilerDaoRepository();
  var refKisiler = FirebaseDatabase.instance.ref().child('kisiler');

  Future<void> kisileriYukle() async {
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <Kisiler>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          liste.add(kisi);
        });

        emit(liste);
      }
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <Kisiler>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          if (kisi.adsoyad.toLowerCase().contains(aramaKelimesi.toLowerCase())){
            liste.add(kisi);
          }
        });

        emit(liste);
      }
    });
  }

  Future<void> sil(String kisi_id) async {
    refKisiler.child(kisi_id).remove();
  }
}