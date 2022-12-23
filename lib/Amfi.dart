import 'package:dersprogrami/%C5%9Fubeler.dart';
import 'package:dersprogrami/amfi_list.dart';
import 'package:dersprogrami/ekle_sil/Aekle.dart';
import 'package:flutter/material.dart';

class Amfi extends StatefulWidget {
  const Amfi({Key? key}) : super(key: key);

  @override
  State<Amfi> createState() => _AmfiState();
}

class _AmfiState extends State<Amfi> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
          title: Text("Amfi"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.door_back_door),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Amfi()));
                }
            )
          ]
      ),
      body: Center(
        child: amfilist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>Amfiekle()));
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
                        Icons.door_back_door,
                        color: Colors.grey,
                        size: 50.0,
                      ),
                      Text(
                        "Amfi",
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> subeler()));
                },
              ),


            ]
        ),
      ),
    );
  }
}
