import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';

class bolumlerK extends
StatefulWidget {
  const bolumlerK({Key? key}) : super(key: key);

  @override
  State<bolumlerK> createState() => _bolumlerKState();
}

class _bolumlerKState extends State<bolumlerK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Icon(
              Icons.play_lesson,
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
                      Icon(
                        Icons.play_lesson,
                        color: Colors.grey,
                        size: 50.0,
                      ),
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> kullanici()));
                },
              ),
            ],
          ),
        )
    );

  }
}
