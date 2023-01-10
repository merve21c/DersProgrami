class OgrenciKapasiteSayfa extends Cubit<void> {
  OgrenciKapasiteSayfa():super(0);

  var OgrenciDepo = OgrenciKapasiteDepo();

  Future<void> kayit(String derslik, String kapasite) async {
    await OgrenciDepo.OgrenciKayit(derslik, kapasite);
  }
}