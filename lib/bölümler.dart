import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';
class bolumler extends StatefulWidget {
  const bolumler({Key? key}) : super(key: key);

  @override
  State<bolumler> createState() => _bolumlerState();
}

class _bolumlerState extends State<bolumler> {
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
