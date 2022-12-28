import 'package:dersprogrami/Lojistik_list.dart';
import 'package:dersprogrami/ekle_sil/LojistikDersPekle.dart';
import 'package:flutter/material.dart';

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
        child: LojistikList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LojistikDersPekle()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
