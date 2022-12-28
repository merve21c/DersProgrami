import 'package:dersprogrami/LojistikSubeAc.dart';
import 'package:flutter/material.dart';

import '../LojistikSubeAc_list.dart';

class LojistikSubeAcBtn extends StatefulWidget {
  const LojistikSubeAcBtn({Key? key}) : super(key: key);

  @override
  State<LojistikSubeAcBtn> createState() => _LojistikSubeAcBtnState();
}

class _LojistikSubeAcBtnState extends State<LojistikSubeAcBtn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Lojistik"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.fire_truck),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LojistikSubeAcBtn()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child:LojistikSubelist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>LojistikSubeAc()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
