import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';
class subeler extends StatefulWidget {
  const subeler({Key? key}) : super(key: key);

  @override
  State<subeler> createState() => _subelerState();
}

class _subelerState extends State<subeler> {
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
                    Icons.door_back_door_outlined,
                    color: Colors.brown,
                    size: 50.0,
                  ),
                  Text(
                    "ŞUBELER",
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
