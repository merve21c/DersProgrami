import 'package:dersprogrami/DerslikBilgileri/%C3%96%C4%9Frenci.dart';
import 'package:dersprogrami/DerslikBilgileri/%C3%96%C4%9FrenciAyr%C4%B1nt%C4%B1Sayfas%C4%B1.dart';
import 'package:dersprogrami/DerslikBilgileri/%C3%96%C4%9FrenciKapasite.dart';
import 'package:dersprogrami/DerslikBilgileri/%C3%96%C4%9FrenciKay%C4%B1tSayfa.dart';
import 'package:flutter/material.dart';

class DerslikAnasayfa extends StatefulWidget {
  const DerslikAnasayfa({Key? key}) : super(key: key);

  @override
  State<DerslikAnasayfa> createState() => _DerslikAnasayfaState();
}

class _DerslikAnasayfaState extends State<DerslikAnasayfa> {
  bool AramaYapiliyorMu= false;

  @override
  void initState() {
    super.initState();
    context.read<OgrenciKapasite>().KisileriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged:(aramaSonucu){
            context.read<OgrenciKapasite>().ara(aramaSonucu);
          } ,)
            : const Text("derslik bilgileri"),
        actions: [
          AramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              AramaYapiliyorMu = false;
            });
            context.read<OgrenciKapasite>().KisileriYukle();
          }, icon:const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              AramaYapiliyorMu = true;
            });
          }, icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<OgrenciKapasite,List<DerslikKapasite>>(
        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: kisilerListesi.length,//3
              itemBuilder: (context,indeks){//0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OgrenciAyrintiSayfa(DerslikBilgi: null!,)))
                        .then((value) { context.read<OgrenciKapasite>().kisileriYukle(); } );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${kisi.derslik} - ${kisi.kapasite}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${kisi.derslik} silinsin mi"),
                              action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: (){
                                    context.read<OgrenciKapasite>().sil(kisi.kisi_id);
                                  }
                              ),
                            ),
                          );
                        }, icon: const Icon(Icons.delete_outline_outlined,color: Colors.black54,))
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Kayıt"),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const OgrenciKayitSayfa()))
              .then((value) { context.read<OgrenciKapasite>().kisileriYukle(); } );
        },
      ),
    );
  }
}
