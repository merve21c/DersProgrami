import 'package:dersprogrami/BilgisayarSubeAc.dart';
import 'package:dersprogrami/BilgsyrSube_list.dart';
import 'package:flutter/material.dart';

class BilgisayarSubeAcBtn extends StatefulWidget {
  const BilgisayarSubeAcBtn({Key? key}) : super(key: key);

  @override
  State<BilgisayarSubeAcBtn> createState() => _BilgisayarSubeAcBtnState();
}

class _BilgisayarSubeAcBtnState extends State<BilgisayarSubeAcBtn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Bilgisayar Programcılığı"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.laptop_chromebook_outlined),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>BilgisayarSubeAc()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child:BilgisayarSubeAclist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>BilgisayarSubeAc()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}