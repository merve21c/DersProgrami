import 'package:dersprogrami/MuhasebeSubeAc.dart';
import 'package:dersprogrami/MuhasebeSube_List.dart';
import 'package:flutter/material.dart';

class MuhasebeSubeAcBtn extends StatefulWidget {
  const MuhasebeSubeAcBtn({Key? key}) : super(key: key);

  @override
  State<MuhasebeSubeAcBtn> createState() => _MuhasebeSubeAcBtnState();
}

class _MuhasebeSubeAcBtnState extends State<MuhasebeSubeAcBtn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Muhasebe"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.calculate_outlined),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MuhasebeSubeAcBtn()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child:MuhasebeSubelist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>MuhasebeSubeAc()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
