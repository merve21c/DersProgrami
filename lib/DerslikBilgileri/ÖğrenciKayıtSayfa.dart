import 'package:flutter/material.dart';

class OgrenciKayitSayfa extends StatefulWidget {
  const OgrenciKayitSayfa({Key? key}) : super(key: key);

  @override
  State<OgrenciKayitSayfa> createState() => _OgrenciKayitSayfaState();
}

class _OgrenciKayitSayfaState extends State<OgrenciKayitSayfa> {
  var derslik = TextEditingController();
  var kapasite = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("derslik bilgi"),
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
               context.read<OgrenciKayitSayfa>().kayit(derslik.text, kapasite.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}