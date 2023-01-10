class OgrenciKapasiteAyrinti extends Cubit<void> {
  OgrenciKapasiteAyrinti():super();

  var OgrenciDepo = OgrenciKapasiteDepo();

  Future<void> guncelle(String kisi_id, String derslikler, String kapasite) async {
    await OgrenciDepo.kisiGuncelle(kisi_id, derslikler, kapasite);
  }
}