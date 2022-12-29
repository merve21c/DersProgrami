import 'package:dersprogrami/B%C3%B6l%C3%BCm_list.dart';
import 'package:flutter/material.dart';

class dersP extends StatefulWidget {
  const dersP({Key? key}) : super(key: key);

  @override
  State<dersP> createState() => _dersPState();
}

class _dersPState extends State<dersP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text("Ders Programı"),
    actions: <Widget>[
    IconButton( icon: Icon(Icons.date_range),
    onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>dersP()));
    }
    )
    ]
    ),
    body: SingleChildScrollView(
    child:bolumlist(),
    ),

    );
  }
}
