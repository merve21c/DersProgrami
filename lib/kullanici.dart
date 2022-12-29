import 'package:dersprogrami/%C3%96kapasite.dart';
import 'package:dersprogrami/girisekrani.dart';
import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/MuhasebedP.dart';
import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/bilgisayarP.dart';
import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/lojistikdP.dart';
import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/sosyalHdP.dart';
import 'package:dersprogrami/ogretmenlerK.dart';
import 'package:flutter/material.dart';
class kullanici  extends StatefulWidget {
  const kullanici({Key? key}) : super(key: key);
  @override
  State<kullanici> createState() => _kullanici();
}

class _kullanici extends State<kullanici> {
  @override
  Widget build(BuildContext context) {
    return Drawer(     //çekme görünümü versin diye drawer wigettini dödürüyoruz
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 50.0,
                  ),
                  Text(
                    "Kullanıcı",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.people),
            title: Text('ÖĞRETMENLER'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ListTile(
                title: Text('Öğretmen Bilgileri'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ogretmenlerK()));
                },
              ),
    ],
          ),
          ExpansionTile(
            leading: Icon(Icons.reduce_capacity),
            title: Text('KAPASİTE'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ListTile(
                title: Text('Öğrenci Kapasitesi'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Okapasite()));
                },
              ),
              ListTile(
                title: Text('Derslik Kapasitesi'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ogretmenlerK()));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.date_range),
            title: Text('Ders Programı'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.laptop_chromebook_outlined),
                title: Text('Bilgisayar Programcılığı'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bilgisayarP()));
                },
              ),
              ListTile(
                leading: Icon(Icons.reduce_capacity),
                title: Text('Sosyal Hizmetler'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SosyalHdP()));
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text('Muhasebe'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>muhasebedP()));
                },
              ),
              ListTile(
                leading: Icon(Icons.fire_truck),
                title: Text('Lojistik'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>lojistikdP()));
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text('Çıkış yap'),
            trailing: Icon(Icons.close),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> girisekrani()));
            },
          ),
        ],
      ),
    );
  }
}