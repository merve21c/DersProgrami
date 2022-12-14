import 'package:dersprogrami/kullanici.dart';
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
              Icons.play_lesson,
              color: Colors.blueGrey.shade300,
              size: 300
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>Oekle() ));
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
                        Icons.play_lesson,
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
