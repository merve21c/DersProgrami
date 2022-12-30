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
  final TextEditingController _gunlerController = TextEditingController();
  final TextEditingController _derslerController =TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService =AuthService();
  bool _isVisible = true;
  String _dropdownValue = KullaniciText.Pazartesi;
  String _dropdownValue1 = KullaniciText.NesneYonelimli;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.registerText),
      body:_body(context)
    );
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
        if(_isLoading) const BeklemeSayfasi(),
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
                Text(
                  KullaniciText.registerQuestionDers,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                _dropdownButton(),
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

  DropdownButton _dropdownButton() {
    return DropdownButton(
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        iconEnabledColor: KullaniciColors.purple,
        value: _dropdownValue,
        items: [
          DropdownMenuItem(
            child: Text(KullaniciText.Pazartesi),
            value: KullaniciText.Pazartesi,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.Sali),
            value: KullaniciText.Sali,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.Carsamba),
            value: KullaniciText.Carsamba,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.Persembe),
            value: KullaniciText.Persembe,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.Cuma),
            value: KullaniciText.Cuma,
          ),
        ],
        onChanged: (value) {
          setState(() {
            _dropdownValue = value;
          });
        });

  }

  DropdownButton _dropdownButton2() {
    return DropdownButton(
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        iconEnabledColor: KullaniciColors.purple,
        value: _dropdownValue,
        items: [
          DropdownMenuItem(
            child: Text(KullaniciText.NesneYonelimli),
            value: KullaniciText.NesneYonelimli,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.MobilProgramlama),
            value: KullaniciText.MobilProgramlama,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.Girisimcilik),
            value: KullaniciText.Girisimcilik,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.GorselProgramlama),
            value: KullaniciText.GorselProgramlama,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.SunucuIsletim),
            value: KullaniciText.SunucuIsletim,
          ),
          DropdownMenuItem(
            child: Text(KullaniciText.GrafikTasarim),
            value: KullaniciText.GrafikTasarim,
          ),
        ],
        onChanged: (value) {
          setState(() {
            _dropdownValue1 = value;
          });
        });
  }

  InkWell _registerButton(BuildContext context) {
    return InkWell(
        onTap: () => _registerOnTap(),
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
        _passwordController.text.isNotEmpty &&
        _dropdownValue.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      _authService
          .createKullanici(
        _usernameController.text,
        _gunlerController.text,
        _derslerController.text,
        _emailController.text,
        _passwordController.text,
      )
          .then((value) {
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
