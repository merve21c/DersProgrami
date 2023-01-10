import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Yonetici/ProgramList.dart';
import 'package:dersprogrami/Yonetici/YoneticiSayfasi.dart';
import 'package:flutter/material.dart';
import '../Kaynak/String.dart';
import '../Sabitler/Renk.dart';

class BilgilerO extends StatefulWidget {
  const BilgilerO({Key? key}) : super(key: key);

  @override
  State<BilgilerO> createState() => _BilgilerOState();
}

class _BilgilerOState extends State<BilgilerO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.dersList),
      body: Scrollbar(
        child:ProgramList(),
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
