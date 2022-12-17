import 'package:dersprogrami/derslerK.dart';
import 'package:dersprogrami/girisekrani.dart';
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

          ListTile(                                   //listviewlarrımıza detaylı eklemeler(icon vs) yapabilmek için bu widgeti kullanıyoruz
            leading: Icon(Icons.door_back_door_outlined),
            title: Text('Derslik'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> derslerK()));
            },
          ),

          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text('Öğrenci kapasitesi'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> derslerK()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text('Öğretmenler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ogretmenlerK()));
            },
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