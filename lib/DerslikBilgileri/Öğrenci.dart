class DerslikKapasite {
  String kisi_id;
  String derslik;
  String kapasite;

  DerslikKapasite({required this.kisi_id,required this.derslik,required this.kapasite});

  factory  DerslikKapasite.fromJson(String key,Map<dynamic,dynamic> json){

    //firebase özelinde keyde dynamic olabiliyor


    return  DerslikKapasite(
        kisi_id: key,
        derslik: json["Derslik"] as String,
        kapasite: json["Kapasite"] as String
    );
  }
}