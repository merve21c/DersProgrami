class KisiDetayCubit extends Cubit<void> {
  KisiDetayCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> guncelle(String kisi_id, String kisi_ad, String kisi_tel) async {
    await krepo.kisiGuncelle(kisi_id, kisi_ad, kisi_tel);