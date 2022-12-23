import 'package:dersprogrami/%C5%9Fubeler.dart';
import 'package:dersprogrami/ekle_sil/Labekle.dart';
import 'package:dersprogrami/lab_list.dart';
import 'package:flutter/material.dart';

class Laboratuvar extends StatefulWidget {
  const Laboratuvar({Key? key}) : super(key: key);

  @override
  State<Laboratuvar> createState() => _LaboratuvarState();
}

class _LaboratuvarState extends State<Laboratuvar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Laboratuvar"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.computer),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Laboratuvar()));
                }
            )
          ]
      ),
      body: Center(
        child:lablist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Labekle()));
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
              Icons.computer,
              color: Colors.grey,
              size: 50.0,
            ),
            Text(
              "Laboratuvar",
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
