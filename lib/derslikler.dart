import 'package:dersprogrami/ekle_sil/drsliksil.dart';
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
          title: Text("sil"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.delete),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>derslikSil()));
                }
            )
          ]
      ),
      body: Center(
        child: Icon(
            Icons.table_restaurant,
            color: Colors.blueGrey.shade300,
            size: 300
        ),
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
