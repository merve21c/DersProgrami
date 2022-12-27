import 'package:dersprogrami/B%C3%B6l%C3%BCm_list.dart';
import 'package:dersprogrami/Bilgisayar_list.dart';
import 'package:dersprogrami/ekle_sil/Bekle.dart';
import 'package:dersprogrami/ekle_sil/veriekle.dart';
import 'package:flutter/material.dart';


class Bilgisayar extends StatefulWidget {
  const Bilgisayar({Key? key}) : super(key: key);

  @override
  State<Bilgisayar> createState() => _BilgisayarState();
}

class _BilgisayarState extends State<Bilgisayar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text("Bilgisayar Programcılığı"),
    actions: <Widget>[
    IconButton( icon: Icon(Icons.laptop_chromebook_outlined),
    onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Bilgisayar()));   //sayfalar arası geçiş
         }
       )
      ]
    ),
    body: Center(
    child: bilgisayarlist(),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>Veriekle()));
    },
    child: Icon(Icons.add),
    ),
    );
  }
}
