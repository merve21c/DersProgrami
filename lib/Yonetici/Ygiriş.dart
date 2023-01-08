import 'package:dersprogrami/Yonetici/YoneticiSayfasi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../GirişEkranı.dart';
import '../Kaynak/Renkler.dart';

class Ygiris extends StatefulWidget {
  const Ygiris({Key? key}) : super(key: key);

  @override
  State<Ygiris> createState() => _YgirisState();
}

class _YgirisState extends State<Ygiris> {
  Future<User?>loginUsingEmailPassword({required String email, required String password,required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    }on FirebaseAuthException catch(e){
      if(e.code == "kullanici yok"){
        print("bu e posta için kullanıcı bulunamadı");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: KullaniciColors.purple),
                    ),
                    labelText: 'E_posta',
                    hintText: 'E_postanızı giriniz',
                    prefixIcon: Icon(
                      Icons.person,
                      color: KullaniciColors.grey,
                    ),
                    labelStyle: TextStyle(color: KullaniciColors.pink),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10.0),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:KullaniciColors.purple),
                    ),
                    labelText: 'Şifre',
                    hintText: 'Şifrenizi giriniz',
                    prefixIcon: Icon(
                      Icons.key_sharp,
                      color: KullaniciColors.grey,
                    ),
                    labelStyle: TextStyle(color: KullaniciColors.pink),
                    border: OutlineInputBorder()),
              ),

              ElevatedButton(
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                  print(user);
                  if(user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> YoneticiSayfasi()));
                  }
                },
                child:const  Text('    Giriş    '),
                style: ElevatedButton.styleFrom(
                  backgroundColor: KullaniciColors.pink,
                ),
              ),
              ElevatedButton(
                child: const Text('Geri Dön'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => girisekrani()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KullaniciColors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}