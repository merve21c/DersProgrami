import 'package:flutter/material.dart';

class SubeAnasayfa extends StatefulWidget {
  const SubeAnasayfa({Key? key}) : super(key: key);

  @override
  State<SubeAnasayfa> createState() => _SubeAnasayfaState();
}

class _SubeAnasayfaState extends State<SubeAnasayfa> {
  bool rastgeleatiyormu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: rastgeleatiyormu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged:(aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          } ,)
            : const Text("subeler"),
        actions: [
          rastgeleatiyormu ?
          IconButton(onPressed: (){
            setState(() {
              rastgeleatiyormu = false;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          }, icon:const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              rastgeleatiyormu = true;
            });
          }, icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<sube>>(
        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: kisilerListesi.length,//3
              itemBuilder: (context,indeks){//0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetaySayfa(bilgi: kisi,)))
                        .then((value) { context.read<AnasayfaCubit>().kisileriYukle(); } );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${kisi.subead} - ${kisi.dersbaslangic}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${kisi.subead} silinsin mi"),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KisiKayitSayfa()))
              .then((value) { context.read<AnasayfaCubit>().kisileriYukle(); } );
        },
      ),
    );
  }
}