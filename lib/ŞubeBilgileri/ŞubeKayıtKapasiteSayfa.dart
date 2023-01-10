import 'package:dersprogrami/%C5%9EubeBilgileri/%C5%9EubeDepo.dart';

class SubeKayitKapasite extends Cubit<void> {
  SubeKayitKapasite():super();

  var Sube = SubeDepo();

  Future<void> kayit(String subead, String dersbaslangic, String dersbitis, String derssuresi,String telefussaat, String ogletatili) async {
    await SubeDepo.kisiKayit(subead, dersbaslangic,dersbitis,derssuresi,telefussaat,ogletatili);
  }
}