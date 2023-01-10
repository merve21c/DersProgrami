import 'package:dersprogrami/DerslikBilgileri/DerslikAnasayfa.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const derslikbilgi());
}

class derslikbilgi extends StatelessWidget {
  const derslikbilgi({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisiKayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DerslikAnasayfa(),
      ),
    );
  }
}