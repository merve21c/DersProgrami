import 'package:dersprogrami/SosyalHSubeAc.dart';
import 'package:dersprogrami/SosyalHSube_list.dart';
import 'package:flutter/material.dart';

class SosyalHSubeAcBtn extends StatefulWidget {
  const SosyalHSubeAcBtn({Key? key}) : super(key: key);

  @override
  State<SosyalHSubeAcBtn> createState() => _SosyalHSubeAcBtnState();
}

class _SosyalHSubeAcBtnState extends State<SosyalHSubeAcBtn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Sosyal Hizmetler"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.reduce_capacity),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SosyalHSubeAcBtn()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child:SosyalHSubeList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>SosyalHSubeAc()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
