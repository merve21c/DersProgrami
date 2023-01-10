import 'package:flutter/material.dart';
import 'GirişEkranı.dart';


//veri tabanı veya diğer bağlantıları pubcpec.yaml dosyamızın içine ekliyoruz

void main(){
  WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
}
class MyApp extends StatelessWidget{
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //üst kısımdaki debug yazısını kaldırmak için.
      home: girisekrani (),
    );
  }
}
