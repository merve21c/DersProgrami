import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';

class bildirim extends StatefulWidget {
  const bildirim({Key? key}) : super(key: key);

  @override
  State<bildirim> createState() => _bildirimState();
}

class _bildirimState extends State<bildirim> {
  @override
  Widget build(BuildContext context) {
    return Drawer(  child: ListView(
      children: <Widget>[
    DrawerHeader(
    child: Align(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.add_alert,
          color: Colors.amberAccent,
          size: 50.0,
        ),
        Text(
          "Bildirimler",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
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
    ),
    ),
    ],
    )
    );


  }
}
