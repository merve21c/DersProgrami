import 'package:dersprogrami/%C3%B6%C4%9Fretmenler.dart';
import 'package:dersprogrami/%C5%9Fubeler.dart';
import 'package:dersprogrami/b%C3%B6l%C3%BCmler.dart';
import 'package:dersprogrami/dersler.dart';
import 'package:dersprogrami/girisekrani.dart';
import 'package:flutter/material.dart';

class kullanici  extends StatefulWidget {
  const kullanici({Key? key}) : super(key: key);

  @override
  State<kullanici> createState() => _kullanici();
}

class _kullanici extends State<kullanici> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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

          ListTile(
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text('Çıkış yap'),
            trailing: Icon(Icons.close),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> girisekrani()));
            },
          ),

          ListTile(
            leading: Icon(Icons.my_library_books),
            title: Text('Dersler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> dersler()));
            },
          ),
          ListTile(
            leading: Icon(Icons.door_back_door_outlined),
            title: Text('Şubeler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> subeler()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text('Öğretmenler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ogretmenler()));
            },
          ),
          ListTile(
            leading: Icon(Icons.play_lesson),
            title: Text('Bölümler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>bolumler()));
            },
          ),
        ],
      ),
    );
  }
}