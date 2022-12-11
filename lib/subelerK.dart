import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';

class subelerK extends StatefulWidget
{
  const subelerK({Key? key}) : super(key: key);

  @override
  State<subelerK> createState() => _subelerKState();
}

class _subelerKState extends State<subelerK> {
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
                    color: Colors.grey,
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
