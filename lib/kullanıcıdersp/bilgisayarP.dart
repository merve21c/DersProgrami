import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/bilgisayarP_list.dart';
import 'package:flutter/material.dart';

class bilgisayarP extends StatefulWidget {
  const bilgisayarP({Key? key}) : super(key: key);

  @override
  State<bilgisayarP> createState() => _bilgisayarPState();
}

class _bilgisayarPState extends State<bilgisayarP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Bilgisayar Programı"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.reduce_capacity),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>bilgisayarP(),));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child: BilgisayarPlist(),
      ),

    );
  }
}
