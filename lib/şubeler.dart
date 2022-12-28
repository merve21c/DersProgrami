import 'package:dersprogrami/ekle_sil/BilgisayarSubeAcBtn.dart';
import 'package:dersprogrami/ekle_sil/SosyalHSubeAcBtn.dart';
import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';
class subeler extends StatefulWidget {
  const subeler({Key? key}) : super(key: key);

  @override
  State<subeler> createState() => _subelerState();
}

class _subelerState extends State<subeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Şubeler"),
        ),
        body: Center(
          child:
          Icon(
              Icons.door_back_door_outlined,
              color: Colors.blueGrey.shade300,
              size: 300
          ),
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
                        Icons.door_back_door_outlined,
                        color: Colors.grey,
                        size: 50.0,
                      ),
                      Text(
                        "ŞUBELER",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BilgisayarSubeAcBtn()));
                },
              ), ListTile(
                leading: Icon(Icons.reduce_capacity),
                title: Text('Sosyal Hizmetler'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SosyalHSubeAcBtn()));
                },
              ), ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text('Muhasebe'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>yonetici()));
                },
              ), ListTile(
                leading: Icon(Icons.fire_truck),
                title: Text('Lojistik'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>yonetici()));
                },
              ),
              ListTile(
                leading: Icon(Icons.keyboard_return),
                title: Text('Geri Dön'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>yonetici()));
                },
              ),

            ],
          ),
        )
    );

  }
}
