import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/sosyalHdP_list.dart';
import 'package:flutter/material.dart';

class SosyalHdP extends StatefulWidget {
  const SosyalHdP({Key? key}) : super(key: key);

  @override
  State<SosyalHdP> createState() => _SosyalHdPState();
}

class _SosyalHdPState extends State<SosyalHdP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Sosyal Hizmetler Programı"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.reduce_capacity),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SosyalHdP(),));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child: sosyalHdPlist(),
      ),

    );
  }
}
