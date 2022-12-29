import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/lojistikdP_list.dart';
import 'package:flutter/material.dart';

class lojistikdP extends StatefulWidget {
  const lojistikdP({Key? key}) : super(key: key);

  @override
  State<lojistikdP> createState() => _lojistikdPState();
}

class _lojistikdPState extends State<lojistikdP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Lojistik Programı"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.fire_truck),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>lojistikdP(),));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child: lojistikdPlist(),
      ),

    );
  }
}

