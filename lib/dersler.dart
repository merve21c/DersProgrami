import 'package:dersprogrami/kullanici.dart.';
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
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
            child: Align(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon(
            Icons.my_library_books,
            color: Colors.grey,
            size: 30.0,
        ),
        Text(
          "DERSLER",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
              ListTile(
                title: Text('geri dön'),
                trailing: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> yonetici()));
                },
              ),
      ],
    ),
  ),
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
  );
  }
}
