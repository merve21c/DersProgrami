import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Sabitler/Bekleme_Sayfas%C4%B1.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Kaynak/String.dart';
import '../Sabitler/Renk.dart';
import '../veritabanı/Unvan_Service.dart';

class EkleUnvanSayfasi extends StatefulWidget {
  const EkleUnvanSayfasi({Key? key}) : super(key: key);

  @override
  State<EkleUnvanSayfasi> createState() => _EkleUnvanSayfasiState();
}

class _EkleUnvanSayfasiState extends State<EkleUnvanSayfasi> {
  TextEditingController _unvanController =TextEditingController();
  UnvanService _unvanService =UnvanService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.addUnvanText),
      body: _body(),
    );
  }

  Stack _body() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _mainBody(),
              _saveButton(context),
            ],
          ),
        ),
     const BeklemeSayfasi(),
      ],
    );
  }

  Flexible _mainBody() {
    return Flexible(
      child: ListView(
        children: [
          _bodyTitle(),
          const SizedBox(
            height: 20,
          ),
          _bodyContainer(),
        ],
      ),
    );
  }

  Widget _bodyTitle() {
    return Container(
      decoration: BoxDecoration(
        color: KullaniciColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          KullaniciText.addDersProgramiTitle,
        ),
      ),
    );
  }

  Container _bodyContainer() {
    return Container(
      decoration: BoxDecoration(
        color: KullaniciColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _UnvanTextField(),
      ),
    );
  }

  TextField _UnvanTextField() {
    return TextField(
        cursorColor: KullaniciColors.pink,
        controller: _unvanController,
        maxLines: 7,
        decoration: InputDecoration(
          hintText: KullaniciText.addDersProgramiTitle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: KullaniciColors.white,
            ),
          ),
    )
    );
  }

  }

  Padding _saveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: KullaniciColors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 40,
            child: Center(
              child: Text(
                KullaniciText.addDersProgramiTitle,
                style: TextStyle(
                  color: KullaniciColors.white,
                ),
              ),
            ),
          )),
    );
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

