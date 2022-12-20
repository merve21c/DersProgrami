import 'package:dersprogrami/derslikler.dart';
import 'package:flutter/material.dart';

class derslikSil extends StatefulWidget {
  const derslikSil({Key? key}) : super(key: key);

  @override
  State<derslikSil> createState() => _derslikSilState();
}

class _derslikSilState extends State<derslikSil> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> derslik()));
                },
              ),
            ],
          ),
        )
    );

  }
}
