import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';

class Okapasite extends StatefulWidget {
  const Okapasite({Key? key}) : super(key: key);

  @override
  State<Okapasite> createState() => _OkapasiteState();
}

class _OkapasiteState extends State<Okapasite> {
  @override
  Widget build(BuildContext context) {
    return   Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.people_outline,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  Text(
                    "Kapasite",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                  ListTile(
                    title: Text('geri dön'),
                    trailing: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> kullanici()));
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
