import 'package:dersprogrami/ekle_sil/MuhasebeDersePkle.dart';
import 'package:dersprogrami/muhasebe_list.dart';
import 'package:flutter/material.dart';


class Muhasebe extends StatefulWidget {
  const Muhasebe({Key? key}) : super(key: key);

  @override
  State<Muhasebe> createState() => _MuhasebeState();
}

class _MuhasebeState extends State<Muhasebe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Muhasebe"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.calculate_outlined),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Muhasebe()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child: muhasebelist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>MuhasebeDersP()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
