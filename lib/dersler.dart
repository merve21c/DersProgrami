import 'package:dersprogrami/Ders_list.dart';
import 'package:dersprogrami/ekle_sil/Dekle.dart';
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
          title: Text("Ders Bilgileri"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.my_library_books),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>dersler()));
                }
            )
          ]
      ),
    body: Scrollbar(
    child:Dlist(),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>Dekle()));
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
    ],
    ),
  )
  );
  }
}
