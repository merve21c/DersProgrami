import 'package:dersprogrami/b%C3%B6l%C3%BCmler.dart';
import 'package:flutter/material.dart';

class Bekle extends StatefulWidget {
  const Bekle({Key? key}) : super(key: key);

  @override
  State<Bekle> createState() => _BekleState();
}

class _BekleState extends State<Bekle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: Center(
          child: Icon(
              Icons.add,
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
                        "BÖLÜMLER",
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> bolumler()));
                },
              ),
            ],
          ),
        )
    );

  }
}
