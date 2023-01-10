import 'package:dersprogrami/DerslikBilgileri/%C3%96%C4%9FrenciKapasiteAyr%C4%B1nt%C4%B1.dart';
import 'package:flutter/material.dart';

class OgrenciAyrintiSayfa extends StatefulWidget {
  OgrenciAyrintiSayfa  DerslikBilgi;
  OgrenciAyrintiSayfa({required this.DerslikBilgi});

  @override
  State<OgrenciAyrintiSayfa > createState() => _OgrenciAyrintiSayfaState();
}

class _OgrenciAyrintiSayfaState extends State<OgrenciAyrintiSayfa > {
  var derslik = TextEditingController();
  var kapasite = TextEditingController();

  @override
  void initState() {
    super.initState();
    var DerslikBilgi = widget.DerslikBilgi;
    derslik.text = DerslikBilgi.derslik;
    kapasite.text = DerslikBilgi.kapasite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: derslik,
                decoration: const InputDecoration(
                  hintText: "derslik",
                ),
              ),
              TextField(
                controller: kapasite,
                decoration: const InputDecoration(
                  hintText: "kapasite",
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<OgrenciKapasiteAyrinti>().guncelle( derslik.text, kapasite.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}