import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';

class bolumlerK extends
StatefulWidget {
  const bolumlerK({Key? key}) : super(key: key);

  @override
  State<bolumlerK> createState() => _bolumlerKState();
}

class _bolumlerKState extends State<bolumlerK> {
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
    Icons.play_lesson,
    color: Colors.grey,
    size: 50.0,
    ),
    Text(
    "BÖLÜMLER",
    style: TextStyle(color: Colors.black, fontSize: 25.0),
    ),
    ListTile(
    title: Text('geri dön'),
    trailing: Icon(Icons.arrow_back),
    onTap: () {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>kullanici()));
    },
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    );
  }
}
