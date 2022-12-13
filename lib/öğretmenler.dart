import 'package:dersprogrami/Oekle.dart';
import 'package:dersprogrami/Ogretmenler/M.Mustafa_Bah%C5%9Fi.dart';
import 'package:dersprogrami/Ogretmenler/Murat_Albayrak.dart';
import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';

class ogretmenler extends StatefulWidget {
  const ogretmenler({Key? key}) : super(key: key);

  @override
  State<ogretmenler> createState() => _ogretmenlerState();
}

class _ogretmenlerState extends State<ogretmenler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>Oekle()));
        },
        child: Icon(Icons.add),
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
                    Icons.people_alt,
                    color: Colors.grey,
                    size: 50.0,
                  ),
                  Text(
                    "Öğretmenler",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            title: Text('geri dön'),
            trailing: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>yonetici()));
            },
          ),
          ListTile(
            title: Text('M.Mustafa Bahşi'),
            trailing: Icon(Icons.person),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Mogretmen()));
            },
          ),
          ListTile(
            title: Text('Murat Albayrak'),
            trailing: Icon(Icons.person),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ogretmen()));
            },
          ),
        ],
      ),
      ),
    );
  }
}

