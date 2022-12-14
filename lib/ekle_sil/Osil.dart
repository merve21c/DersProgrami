import 'package:dersprogrami/yonetici.dart';
import 'package:flutter/material.dart';

class Osil extends StatefulWidget {
  const Osil({Key? key}) : super(key: key);

  @override
  State<Osil> createState() => _OsilState();
}

class _OsilState extends State<Osil> {
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
                        "ÖĞRETMENLER",
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> yonetici()));
                },
              ),
            ],
          ),
        )
      );

  }
}
