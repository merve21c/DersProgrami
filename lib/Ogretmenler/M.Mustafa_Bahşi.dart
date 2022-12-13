import 'package:dersprogrami/%C3%B6%C4%9Fretmenler.dart';
import 'package:flutter/material.dart';

class Mogretmen extends StatefulWidget {
  const Mogretmen({Key? key}) : super(key: key);

  @override
  State<Mogretmen> createState() => _MogretmenState();
}

class _MogretmenState extends State<Mogretmen> {
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
                      Icons.person,
                      color: Colors.grey,
                      size: 50.0,
                    ),
                    Text(
                      "M.Mustafa Bahşi",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ogretmenler()));
              },
            ),
          ]
      ),
    );
  }
}
