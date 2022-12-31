import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:dersprogrami/Kaynak/String.dart';
import 'package:dersprogrami/Kullan%C4%B1c%C4%B1/DersVeM%C3%BCsaitG%C3%BCn.dart';
import 'package:dersprogrami/Kullan%C4%B1c%C4%B1/Kgiri%C5%9F.dart';
import 'package:flutter/material.dart';

import '../Sabitler/Renk.dart';
import '../Yonetici/EkleUnvanList.dart';
import '../veritabanı/kimlikdoğrulama.dart';


class KullaniciSayfasi extends StatefulWidget {
  const KullaniciSayfasi({Key? key}) : super(key: key);

  @override
  State<KullaniciSayfasi> createState() => _KullaniciSayfasiState();
}

class _KullaniciSayfasiState extends State<KullaniciSayfasi> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.homeText),
      drawer: _drawer(),
      body: const EkleUnvanList(),
      floatingActionButton: _floatingActionButton(),
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
          _drawerLogout(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _userAccountsDrawer() {
    return UserAccountsDrawerHeader(
      accountName: const Text("Kullanici"),
      accountEmail: const Text("Kullanici@gmail.com"),
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
        Navigator.pop(context);
      },
    );
  }


  ListTile _drawerLogout() {
    return ListTile(
      title: Text(KullaniciText.logoutText),
      onTap: () {
        _authService.signOut();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Kgiris()),
                (route) => false);
      },
      leading: Icon(
        Icons.remove_circle,
        color: KullaniciColors.pink,
      ),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: KullaniciColors.grey,
      elevation: 0.0,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DersVeMusaitGun(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
  }
