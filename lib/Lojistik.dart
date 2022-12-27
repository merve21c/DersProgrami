import 'package:dersprogrami/B%C3%B6l%C3%BCm_list.dart';
import 'package:flutter/material.dart';
import 'ekle_sil/Bekle.dart';

class Lojistik extends StatefulWidget {
  const Lojistik({Key? key}) : super(key: key);

  @override
  State<Lojistik> createState() => _LojistikState();
}

class _LojistikState extends State<Lojistik> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Lojistik"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.fire_truck_sharp),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Lojistik()));   //sayfalar arası geçiş
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
