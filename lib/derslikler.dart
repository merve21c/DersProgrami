import 'package:dersprogrami/derslik_list.dart';
import 'package:dersprogrami/ekle_sil/drslkekle.dart';
import 'package:flutter/material.dart';

class derslik extends StatefulWidget {
  const derslik({Key? key}) : super(key: key);

  @override
  State<derslik> createState() => _derslikState();
}

class _derslikState extends State<derslik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Derslik"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.table_restaurant),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>derslik()));
                }
            )
          ]
      ),
      body: Center(
        child:dersliklist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>derslikekle()));
        },
        child: Icon(Icons.add),
      ),


    );
  }
}
