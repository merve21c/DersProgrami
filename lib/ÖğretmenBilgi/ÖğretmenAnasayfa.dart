import 'package:flutter/material.dart';

class OgretmenAnaSayfa extends StatefulWidget {
  OgretmenAnaSayfa({Key? key}) : super(key: key);

  @override
  OgretmenAnaSayfa createState() => _OgretmenAnaSayfaState();
}
class _OgretmenAnSayfaState extends State<OgretmenAnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('öğretmen ekranı'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OgretmenEkle(),
                  ),
                )
              },
              child: Text('Ekle', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
