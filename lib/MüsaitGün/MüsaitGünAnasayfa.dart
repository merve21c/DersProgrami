import 'package:flutter/material.dart';

class MusaitGunAnasayfa extends StatefulWidget {
  const MusaitGunAnasayfa({Key? key}) : super(key: key);

  @override
  State<MusaitGunAnasayfa> createState() => MusaitGunAnasayfaState();
}

class _MusaitGunAnasayfaState extends State<MusaitGunAnasayfa> {
  bool rastgeleseciyormu = false;

  @override
  void initState() {
    super.initState();
    context.read<MusaitGunAnasayfa>().kisileriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: rastgeleseciyormu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged:(aramaSonucu){
            context.read<MusaitGunAnasayfa>().ara(aramaSonucu);
          } ,)
            : const Text("Kişiler"),
        actions: [
          rastgeleseciyormu ?
          IconButton(onPressed: (){
            setState(() {
              rastgeleseciyormu = false;
            });
            context.read<MusaitGunAnasayfa>().kisileriYukle();
          }, icon:const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              rastgeleseciyormu = true;
            });
          }, icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<MusaitGunAnasayfa,List<Kisiler>>(
        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: kisilerListesi.length,//3
              itemBuilder: (context,indeks){//0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OgretmenAyrintiSayfa(kisi: kisi,)))
                        .then((value) { context.read<MusaitGunAnasayfa>().kisileriYukle(); } );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${kisi.adsoyad} - ${kisi.musaitgun}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${kisi.adsoyad} silinsin mi"),
                              action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: (){
                                    context.read<AnasayfaCubit>().sil(kisi.kisi_id);
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Og()))
              .then((value) { context.read<>().kisileriYukle(); } );
        },
      ),
    );
  }
}
