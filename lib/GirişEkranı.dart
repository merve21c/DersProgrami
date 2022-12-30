import 'package:flutter/material.dart';

import 'Kullanıcı/Kgiriş.dart';

class girisekrani extends StatefulWidget {
  const girisekrani({Key? key}) : super(key: key);

  @override
  State<girisekrani> createState() => _girisekraniState();
}

class _girisekraniState extends State<girisekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 150.0, right: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text('Kullanıcı'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Kgiris()));
                  },
                ),

              ]
          ),
        ),
      ),
    );
  }
}
