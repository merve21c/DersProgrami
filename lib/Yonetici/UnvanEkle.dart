import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Kaynak/Renkler.dart';
import '../veritabanı/DersVeGünlerService.dart';

class UnvanEkle extends StatefulWidget {
  const UnvanEkle({Key? key}) : super(key: key);

  @override
  State<UnvanEkle> createState() => _UnvanEkleState();
}

class _UnvanEkleState extends State<UnvanEkle> {
  DersVeGunService _dersVeGunService =DersVeGunService();

  bool?
  OgretimUyesi=false,
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
      OgretimUyesi = (prefs.getBool("Öğretim Üyesi")) ?? true;
      DrOgretimUyesi = (prefs.getBool("Dr.Öğretim Üyesi")) ?? false;

    });
  }

  _secValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("OgretimUyesi", OgretimUyesi!);
      prefs.setBool("DrOgretimUyesi", DrOgretimUyesi!);
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
              title: Text('Ünvan Seçimi'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                CheckboxListTile(
                  value: OgretimUyesi,
                  onChanged: (bool? value) {
                    setState(
                          () {
                        OgretimUyesi = value;
                        _secValue();
                      },
                    );
                  },
                  title: Text("Öğretim Üyesi"),
                ),
                CheckboxListTile(
                  value: DrOgretimUyesi,
                  onChanged: (bool? value) {
                    setState(() {
                      DrOgretimUyesi = value;
                      _secValue();
                    });
                  },
                  title: Text("Dr. Öğretim Üyesi"),
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
                      msg: " Ünvan eklendi!",
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