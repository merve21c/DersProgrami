import 'package:dersprogrami/dersler.dart';
import 'package:flutter/material.dart';

class Dsil extends StatefulWidget {
  const Dsil({Key? key}) : super(key: key);

  @override
  State<Dsil> createState() => _DsilState();
}

class _DsilState extends State<Dsil> {
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> dersler()));
                },
              ),
            ],
          ),
        )
    );

  }
}
