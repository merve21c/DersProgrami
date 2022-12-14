import 'package:dersprogrami/ekle_sil/Sekle.dart';
import 'package:dersprogrami/kullanici.dart';
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
          child: Icon(
              Icons.door_back_door_outlined,
              color: Colors.blueGrey.shade300,
              size: 300
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Sekle()));
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
                        Icons.door_back_door_outlined,
                        color: Colors.grey,
                        size: 50.0,
                      ),
                      Text(
                        "Dersler",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
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
