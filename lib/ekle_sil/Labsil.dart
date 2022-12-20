import 'package:dersprogrami/%C5%9Fubeler.dart';
import 'package:flutter/material.dart';

class Labsil extends StatefulWidget {
  const Labsil({Key? key}) : super(key: key);

  @override
  State<Labsil> createState() => _LabsilState();
}

class _LabsilState extends State<Labsil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: Center(
          child: Icon(
              Icons.delete,
              color: Colors.blueGrey.shade300,
              size: 300
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Dersler",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.keyboard_return),
                title: Text('Geri dön'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> subeler()));
                },
              ),
            ],
          ),
        )
    );

  }
}
