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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Ssil()));
                }
            )
          ]
      ),
      body: Center(
        child: Icon(
            Icons.door_back_door_outlined,
            color: Colors.blueGrey.shade300,
            size: 300
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ()));
        },
        child: Icon(Icons.add),
      ),


    );
  }
}
