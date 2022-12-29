import 'package:dersprogrami/%C3%B6grM%C3%BCsaitGn_list.dart';
import 'package:flutter/material.dart';


class ogrMusaitgun extends StatefulWidget {
  const ogrMusaitgun({Key? key}) : super(key: key);

  @override
  State<ogrMusaitgun> createState() => _ogrMusaitgunState();
}

class _ogrMusaitgunState extends State<ogrMusaitgun> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
    title: Text("Dersler ve Müsait Günler"),
    actions: <Widget>[
    IconButton( icon: Icon(Icons.date_range),
    onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>ogrMusaitgun()));
    }
    )
    ]
    ),
    body: Scrollbar(
    child:ogrMusaitGunlist(),
    ),

    );
  }
}
