import 'package:dersprogrami/B%C3%B6l%C3%BCm_list.dart';
import 'package:dersprogrami/Sosyalhizmet_list.dart';
import 'package:dersprogrami/ekle_sil/SosyalHDersPekle.dart';
import 'package:flutter/material.dart';

import 'ekle_sil/Bekle.dart';

class Sosyalhizmet extends StatefulWidget {
  const Sosyalhizmet({Key? key}) : super(key: key);

  @override
  State<Sosyalhizmet> createState() => _SosyalhizmetState();
}

class _SosyalhizmetState extends State<Sosyalhizmet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Sosyal Hizmetler"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.people_alt_rounded),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Sosyalhizmet()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child:SosyalHList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>SosyalHDersP()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
