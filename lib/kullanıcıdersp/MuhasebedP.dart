import 'package:dersprogrami/kullan%C4%B1c%C4%B1dersp/muhasebedPlist.dart';
import 'package:flutter/material.dart';

class muhasebedP extends StatefulWidget {
  const muhasebedP({Key? key}) : super(key: key);

  @override
  State<muhasebedP> createState() => _muhasebedPState();
}

class _muhasebedPState extends State<muhasebedP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Muhasebe Programı"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.calculate_outlined),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>muhasebedP(),));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Center(
        child: muhasebedPlist(),
      ),

    );
  }
}
