import 'package:dersprogrami/Giri%C5%9FEkran%C4%B1.dart';
import 'package:dersprogrami/Kaynak/String.dart';
import 'package:dersprogrami/Sabitler/Bekleme_Sayfas%C4%B1.dart';
import 'package:dersprogrami/veritaban%C4%B1/kimlikdo%C4%9Frulama.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Kaynak/Renkler.dart';
import '../Sabitler/Renk.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KayitSayfasi> createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  bool _isVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KullaniciColors.mainColor,
        appBar: RenkAppBar(KullaniciText.registerText),
        body: _body(context));
  }

  Stack _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bodyContainer(),
              const SizedBox(
                height: 55,
              ),
              _registerButton(context),
            ],
          ),
        ),
        if (_isLoading) const BeklemeSayfasi(),
      ],
    );
  }

  Flexible _bodyContainer() {
    return Flexible(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _usernameTextField(),
                const SizedBox(
                  height: 20,
                ),
                _emailTextField(),
                const SizedBox(
                  height: 20,
                ),
                _passwordTextField(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _usernameTextField() {
    return TextField(
      controller: _usernameController,
      cursorColor: KullaniciColors.grey,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: KullaniciColors.grey,
        ),
        hintText: KullaniciText.username,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KullaniciColors.mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KullaniciColors.pink),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextField _emailTextField() {
    return TextField(
      controller: _emailController,
      cursorColor: KullaniciColors.grey,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: KullaniciColors.grey,
        ),
        hintText: KullaniciText.email,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KullaniciColors.mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KullaniciColors.purple),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextField _passwordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: _isVisible ? true : false,
      cursorColor: KullaniciColors.black,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            if (_isVisible) {
              setState(() {
                _isVisible = false;
              });
            } else {
              setState(() {
                _isVisible = false;
              });
              _isVisible = true;
            }
          },
          child: _isVisible
              ? Icon(
                  Icons.remove_red_eye,
                  color: KullaniciColors.grey,
                )
              : Icon(
                  Icons.remove_red_eye_outlined,
                  color: KullaniciColors.grey,
                ),
        ),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: KullaniciColors.grey,
        ),
        hintText: KullaniciText.password,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KullaniciColors.mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KullaniciColors.pink),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  InkWell _registerButton(BuildContext context) {
    return InkWell(
        onTap: () => _registerOnTap(), //kayıt ol butonu
        child: Container(
          decoration: BoxDecoration(
            color: KullaniciColors.pink,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          child: Center(
            child: Text(
              KullaniciText.registerText,
              style: TextStyle(
                color: KullaniciColors.white,
              ),
            ),
          ),
        ));
  }

  void _registerOnTap() {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      _authService
          .createKullanici(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      )
          .then((value) {
        Fluttertoast.showToast(
            msg: "Kayıt Başarılı!",
            timeInSecForIosWeb: 5,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey[600],
            textColor: Colors.white,
            fontSize: 14);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const girisekrani()),
            (route) => false);
      }).catchError((error) {
        _warningToast(KullaniciText.errorText);
      }).whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      _warningToast(KullaniciText.emptyText);
    }
  }

  Future<bool?> _warningToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: KullaniciColors.white,
        textColor: KullaniciColors.black,
        fontSize: 14);
  }

}
