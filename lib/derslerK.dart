import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';
class derslerK extends StatefulWidget {
  const derslerK({Key? key}) : super(key: key);

  @override
  State<derslerK> createState() => _derslerKState();
}

class _derslerKState extends State<derslerK> {
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
                    size: 30.0,
                  ),
                  Text(
                    "Derslik",
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
