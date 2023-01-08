import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Kaynak/Renkler.dart';
import '../veritabanı/DersVeGünlerService.dart';

class YdersVeGun extends StatefulWidget {
  const YdersVeGun({Key? key}) : super(key: key);

  @override
  State<YdersVeGun> createState() => _YdersVeGunState();
}

class _YdersVeGunState extends State<YdersVeGun> {
  DersVeGunService _dersVeGunService =DersVeGunService();

  bool? OgretimUyesi=false,
  DrOgretimUyesi=false,
  Pazartesi =false,
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

  _kontrolValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Pazartesi = (prefs.getBool("Pazartesi")) ?? true;
      Sali = (prefs.getBool("Salı")) ?? false;
      Carsamba = (prefs.getBool("Çarşamba")) ?? false;
      Persembe = (prefs.getBool("Perşembe")) ?? false;
      Cuma = (prefs.getBool("Cuma")) ?? false;

      Nesne = (prefs.getBool("Nesne Yönelimli Programlama")) ?? false;
      Programlama = (prefs.getBool("Programlama Temelleri")) ?? false;
      Mobil = (prefs.getBool("Mobil Programlama")) ?? false;
      Gorsel = (prefs.getBool("Görsel Programlama")) ?? false;
      Veri = (prefs.getBool("Veri Yapıları ")) ?? false;
    });
  }

  _secValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("Pazartesi", Pazartesi!);
      prefs.setBool("Salı", Sali!);
      prefs.setBool("Çarşamba", Carsamba!);
      prefs.setBool("Perşembe", Persembe!);
      prefs.setBool("Cuma", Cuma!);
      prefs.setBool("Nesne Yönelimli Programlama", Nesne!);
      prefs.setBool("Programlama Temelleri", Programlama!);
      prefs.setBool("Mobil Programlama", Mobil!);
      prefs.setBool("Görsel Programlama", Gorsel!);
      prefs.setBool("Veri Yapıları", Veri!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ders Ve Müsait Günler"),
          backgroundColor: KullaniciColors.purple),
      body: SingleChildScrollView(
        child: Container(
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
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 80, bottom: 95),
              child: InkWell(
                onTap: () {
                  _dersVeGunService
                      .addDersVeGun(
                    OgretimUyesi.toString(),
                      DrOgretimUyesi.toString(),
                      Pazartesi.toString(),
                      Sali.toString(),
                      Carsamba.toString(),
                      Persembe.toString(),
                      Cuma.toString(),
                      Nesne.toString(),
                      Programlama.toString(),
                      Mobil.toString(),
                      Gorsel.toString(),
                      Veri.toString());
                  Fluttertoast.showToast(
                      msg: " Bilgiler eklendi!",
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[600],
                      textColor: Colors.white,
                      fontSize: 14);
                  Navigator.pop(context);

                },
                child: Text('Seç'),

              ),
            )
          ]),
        ),
      ),
    );
  }
}
