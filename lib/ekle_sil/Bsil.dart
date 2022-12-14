import 'package:dersprogrami/b%C3%B6l%C3%BCmler.dart';
import 'package:flutter/material.dart';

class Bsil extends StatefulWidget {
  const Bsil({Key? key}) : super(key: key);

  @override
  State<Bsil> createState() => _BsilState();
}

class _BsilState extends State<Bsil> {
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
