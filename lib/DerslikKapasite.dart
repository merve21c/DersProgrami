import 'package:dersprogrami/DerslikKapasite_list.dart';
import 'package:dersprogrami/ekle_sil/DerslikKapasiteEkle.dart';
import 'package:flutter/material.dart';

class DerslikKapasite extends StatefulWidget {
  const DerslikKapasite({Key? key}) : super(key: key);

  @override
  State<DerslikKapasite> createState() => _DerslikKapasiteState();
}

class _DerslikKapasiteState extends State<DerslikKapasite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Derslik Kapasitesi"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.table_restaurant_sharp),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>DerslikKapasite()));   //sayfalar arası geçiş
                }
            )
          ]
      ),
      body: Scrollbar(
        child: DerslikKapasiteList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>DerslikKapasiteEkle()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
