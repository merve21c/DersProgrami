import 'package:dersprogrami/Yonetici/YoneticiSayfasi.dart';
import 'package:dersprogrami/Yonetici/dersVeGun_list.dart';
import 'package:flutter/material.dart';

import '../Kaynak/Renkler.dart';
import '../Kaynak/String.dart';
import '../Sabitler/Renk.dart';

class Obilgiler extends StatefulWidget {
  const Obilgiler({Key? key}) : super(key: key);

  @override
  State<Obilgiler> createState() => _ObilgilerState();
}

class _ObilgilerState extends State<Obilgiler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.dersList),
      body: Scrollbar(
        child:YDersVeMusaitGunlist(),
      ),

      drawer: _drawer(),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _userAccountsDrawer(),
          _drawerHome(),
          const Divider(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _userAccountsDrawer() {
    return UserAccountsDrawerHeader(
      accountName: const Text("Ders Ve Gun"),
      accountEmail: const Text(""),
      decoration: BoxDecoration(color:KullaniciColors.purple),
    );
  }
  ListTile _drawerHome() {
    return ListTile(
        title: Text(KullaniciText.homeText),
        leading: Icon(
          Icons.home,
          color: KullaniciColors.pink,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const YoneticiSayfasi(),
            ),
          );
        }
    );}}
