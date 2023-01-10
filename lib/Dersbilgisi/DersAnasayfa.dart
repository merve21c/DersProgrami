import 'package:dersprogrami/Dersbilgisi/DersEkleme.dart';
import 'package:dersprogrami/Dersbilgisi/DersList.dart';
import 'package:flutter/material.dart';
class DersAnasayfa extends StatefulWidget {
  DersAnasayfa({Key? key}) : super(key: key);

  @override
  _DersAnasayfaState createState() => _DersAnasayfaState();
}

class _DersAnasayfaState extends State<DersAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ders Bilgileri '),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OgrenciEkle(),
                  ),
                )
              },
              child: Text('Ekle', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: OgrenciList(),
    );
  }
}