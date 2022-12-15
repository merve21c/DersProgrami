import 'package:flutter/material.dart';
import 'girisekrani.dart';
import 'package:firebase_core/firebase_core.dart';

//veri tabanı veya diğer bağlantıları pubcpec.yaml dosyamızın içine ekliyıeuz

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();     //veri tabanını çalıştırmak için
    runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) :super(key: key);
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //üst kısımdaki debug yazısını kaldırmak için.
      home: girisekrani (),
    );
  }
}
