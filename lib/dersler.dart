import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';
class dersler extends StatefulWidget {
  const dersler({Key? key}) : super(key: key);

  @override
  State<dersler> createState() => _derslerState();
}

class _derslerState extends State<dersler> {
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
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
    Icons.my_library_books,
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
    Icons.my_library_books,
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
    ListTile(
          leading: Icon(Icons.my_library_books),
          title: Text('matemmatik'),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=> dersler()));
          },
        ),
    ],
    ),
  )
  );
  }
}
