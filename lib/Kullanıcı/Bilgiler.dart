import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Kullan%C4%B1c%C4%B1/DersVeM%C3%BCsaitGn_list.dart';
import 'package:dersprogrami/Kullan%C4%B1c%C4%B1/kullaniciSayfas%C4%B1.dart';
import 'package:flutter/material.dart';
import '../Kaynak/String.dart';
import '../Sabitler/Renk.dart';

class Bilgiler extends StatefulWidget {
  const Bilgiler({Key? key}) : super(key: key);

  @override
  State<Bilgiler> createState() => _BilgilerState();
}

class _BilgilerState extends State<Bilgiler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.dersList),
      body: Scrollbar(
        child:DersVeMusaitGunList(),
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
            builder: (context) => const KullaniciSayfasi(),
        ),
    );
  }
    );}}
