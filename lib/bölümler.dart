import 'package:dersprogrami/Lojistik.dart';
import 'package:dersprogrami/bilgisayarP.dart';
import 'package:dersprogrami/muhasebe.dart';
import 'package:dersprogrami/sosyalhizmetler.dart';
import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';
class bolumler extends StatefulWidget {
  const bolumler({Key? key}) : super(key: key);

  @override
  State<bolumler> createState() => _bolumlerState();
}

class _bolumlerState extends State<bolumler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Bölümler"),
            actions: <Widget>[
              IconButton( icon: Icon(Icons.play_lesson),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>bolumler()));   //sayfalar arası geçiş
                  }
              )
            ]
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.play_lesson,
                        color: Colors.grey,
                        size: 50.0,
                      ),
                      Text(
                        "BÖLÜMLER",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.laptop_chromebook_outlined),
                title: Text('Bilgisayar Programcılığı'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Bilgisayar()));
                },
              ),  ListTile(
                leading: Icon(Icons.people_alt_rounded),
                title: Text('Sosyal Hizmetler'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Sosyalhizmet()));
                },
              ),  ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text('Muhasebe'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Muhasebe()));
                },
              ),  ListTile(
                leading: Icon(Icons.fire_truck_sharp),
                title: Text('Lojistik'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Lojistik()));
                },
              ),
              ListTile(
                leading: Icon(Icons.keyboard_return),
                title: Text('Geri dön'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> yonetici()));
                },
              ),
            ],
          ),
        )
    );

  }
}
