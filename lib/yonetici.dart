import 'package:dersprogrami/%C3%B6%C4%9Fretmenler.dart';
import 'package:dersprogrami/%C5%9Fubeler.dart';
import 'package:dersprogrami/b%C3%B6l%C3%BCmler.dart';
import 'package:dersprogrami/y%C3%B6netici/bildirim.dart';
import 'package:dersprogrami/dersler.dart';
import 'package:dersprogrami/girisekrani.dart';
import 'package:flutter/material.dart';

class yonetici extends StatefulWidget {
  const yonetici({Key? key}) : super(key: key);

  @override
  State<yonetici> createState() => _yoneticiState();
}

class _yoneticiState extends State<yonetici> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Icon(
            Icons.person,
            color: Colors.blueGrey.shade300,
            size: 300
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>bildirim() ));
        },
        child: Icon(Icons.add_alert),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:Text("Yönetici") ,
              accountEmail:Text("yonetici@gmail.com"),
            ),
            ListTile(title: Text("Anasayfa"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
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
      ),
    );
  }
}