import 'package:dersprogrami/B%C3%B6l%C3%BCm_list.dart';
import 'package:flutter/material.dart';

import 'ekle_sil/Bekle.dart';

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
        child: bolumlist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>Bekle()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
