import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DersVeMusaitGun extends StatefulWidget {
  const DersVeMusaitGun({Key? key}) : super(key: key);

  @override
  State<DersVeMusaitGun> createState() => _DersVeMusaitGunState();
}

class _DersVeMusaitGunState extends State<DersVeMusaitGun> {
  bool? Pazartesi = false,
      Sali = false,
      Carsamba = false,
      Persembe = false,
      Cuma = false;
  bool? Nesne = false,
      Programlama = false,
      Mobil = false,
      Gorsel = false,
      Veri = false;


  @override
  void initState() {

    _kontrolValue();

  }

  _kontrolValue() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    setState(() {
      Pazartesi = (prefs.getBool("Pazartesi")) ?? false ;
      Sali = (prefs.getBool("Salı")) ?? false ;
      Carsamba= (prefs.getBool("Çarşamba")) ?? false ;
      Persembe = (prefs.getBool("Perşembe")) ?? false ;
      Cuma = (prefs.getBool("Cuma")) ?? false ;

    });

  }

  _secValue() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    setState(() {

      prefs.setBool("Pazartesi",Pazartesi!);
      prefs.setBool("Salı",Sali!);
      prefs.setBool("Çarşamba",Carsamba!);
      prefs.setBool("Perşembe",Persembe!);
      prefs.setBool("Cuma",Cuma!);


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ders Ve Müsait Günler"),
          backgroundColor: KullaniciColors.purple),
      body: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          alignment: Alignment.topLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ExpansionTile(
              leading: Icon(Icons.date_range),
              title: Text('Gün Seçimi'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                CheckboxListTile(
                  value: Pazartesi,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        Pazartesi = value;
                        _secValue();
                      },
                    );
                  },
                  title: Text("Pazartesi"),
                ),
                CheckboxListTile(
                  value: Sali,
                  onChanged: (bool? value) {
                    setState(() {
                      Sali = value;
                      _secValue();
                    });
                  },
                  title: Text("Salı"),
                ),
                CheckboxListTile(
                  value: Carsamba,
                  onChanged: (bool? value) {
                    setState(() {
                      Carsamba = value;
                      _secValue();
                    });
                  },
                  title: Text("Çarşamba"),
                ),
                CheckboxListTile(
                  value: Persembe,
                  onChanged: (bool? value) {
                    setState(() {
                      Persembe = value;
                      _secValue();
                    });
                  },
                  title: Text("Perşembe"),
                ),
                CheckboxListTile(
                  value: Cuma,
                  onChanged: (bool? value) {
                    setState(() {
                      Cuma = value;
                      _secValue();
                    });
                  },
                  title: Text("Cuma"),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.border_color_outlined),
              title: Text('Ders Seçimi'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                CheckboxListTile(
                  value: Nesne,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        Nesne = value;
                        _secValue();
                      },
                    );
                  },
                  title: Text("Nesne Yönelimli Programlama"),
                ),
                CheckboxListTile(
                  value: Programlama,
                  onChanged: (bool? value) {
                    setState(() {
                      Programlama = value;
                      _secValue();
                    });
                  },
                  title: Text("Programlama Temelleri"),
                ),
                CheckboxListTile(
                  value: Mobil,
                  onChanged: (bool? value) {
                    setState(() {
                      Mobil = value;
                      _secValue();
                    });
                  },
                  title: Text("Mobil Programlama"),
                ),
                CheckboxListTile(
                  value: Gorsel,
                  onChanged: (bool? value) {
                    setState(() {
                      Gorsel = value;
                      _secValue();
                    });
                  },
                  title: Text("Görsel Programlama"),
                ),
                CheckboxListTile(
                  value: Veri,
                  onChanged: (bool? value) {
                    setState(() {
                      Veri = value;
                      _secValue();
                    });
                  },
                  title: Text("Veri Yapıları"),
                ),
              ],
            ),
          ])),
    );
  }
}
