import 'package:dersprogrami/O_list.dart';
import 'package:dersprogrami/ekle_sil/Oekle.dart';
import 'package:dersprogrami/ekle_sil/Osil.dart';
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
      appBar: AppBar(
          title: Text("sil"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.delete),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Osil()));
                }
            )
          ]
      ),
      body: Center(
        child: Olist(),
      ),/*Center(
        child: Icon(
            Icons.people_alt,
            color: Colors.blueGrey.shade300,
            size: 300
        ),
      ),*/
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
        ],
      ),
      ),
    );
  }
}

