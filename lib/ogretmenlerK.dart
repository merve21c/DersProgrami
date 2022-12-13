import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';

class ogretmenlerK extends StatefulWidget {
  const ogretmenlerK({Key? key}) : super(key: key);

  @override
  State<ogretmenlerK> createState() => _ogretmenlerKState();

}

class _ogretmenlerKState extends State<ogretmenlerK> {
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
                    Icons.people_alt,
                    color: Colors.grey,
                    size: 50.0,
                  ),
                  Text(
                    "Öğretmenler",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
                    title: Text('geri dön'),
                    trailing: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>kullanici()));
                    },
                  ),
          ListTile(
            title: Text('Murat Albayrak'),
            trailing: Icon(Icons.person),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>kullanici()));
            },
          ),
                ],
              ),
    );
  }
}
