import 'package:dersprogrami/BilgsyrSube_list.dart';
import 'package:dersprogrami/SubeAc.dart';
import 'package:flutter/material.dart';
import '../bilgisayarP.dart';


class BilgisayarSubeAc extends StatefulWidget {
  const BilgisayarSubeAc({Key? key}) : super(key: key);

  @override
  State<BilgisayarSubeAc> createState() => _BilgisayarSubeAcState();
}

class _BilgisayarSubeAcState extends State<BilgisayarSubeAc> {
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
        child:BilgisayarSubeAclist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>SubeAc()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}