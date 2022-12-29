import 'package:dersprogrami/Ogrkapasite_list.dart';
import 'package:dersprogrami/ekle_sil/OgrKapasiteEkle.dart';
import 'package:flutter/material.dart';

class Okapasite extends StatefulWidget {
  const Okapasite({Key? key}) : super(key: key);

  @override
  State<Okapasite> createState() => _OkapasiteState();
}

class _OkapasiteState extends State<Okapasite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Öğrenci Kapasitesi"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.reduce_capacity),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Okapasite()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Scrollbar(
        child: OgrkapasiteList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>OgrKapasiteEkle()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
