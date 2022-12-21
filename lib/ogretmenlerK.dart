import 'package:dersprogrami/Kullanici/OgK.dart';
import 'package:dersprogrami/kullanici.dart';
import 'package:flutter/material.dart';

class ogretmenlerK extends StatefulWidget {
  const ogretmenlerK({Key? key}) : super(key: key);

  @override
  State<ogretmenlerK> createState() => _ogretmenlerKState();

}

class _ogretmenlerKState extends State<ogretmenlerK> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      appBar: AppBar(
          title: Text("Ders ve Günler"),
          actions: <Widget>[
            IconButton( icon: Icon(Icons.date_range_outlined),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)  =>OgK(Oadi: '',gun: '',ders: '',)));
                }
            )
          ]
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.date_range_outlined,
                      color: Colors.grey,
                      size: 50.0,
                    ),
                    Text(
                      "Ders ve Günler",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              title: Text('geri dön'),
              trailing: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>kullanici()));
              },
            ),
          ],
        ),
      ),
    );
  }
}