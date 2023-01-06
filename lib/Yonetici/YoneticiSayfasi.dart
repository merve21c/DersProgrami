import 'package:dersprogrami/veritaban%C4%B1/kimlikdo%C4%9Frulama.dart';
import 'package:flutter/material.dart';
import '../Kaynak/Renkler.dart';
import '../Kaynak/String.dart';
import '../Sabitler/Renk.dart';
import 'Ygiriş.dart';

class YoneticiSayfasi extends StatefulWidget {
  const YoneticiSayfasi({Key? key}) : super(key: key);

  @override
  State<YoneticiSayfasi> createState() => _YoneticiSayfasiState();
}

class _YoneticiSayfasiState extends State<YoneticiSayfasi> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KullaniciColors.mainColor,
      appBar: RenkAppBar(KullaniciText.homeText),
      //body:_ekleunvanlist(),
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
          _drawerLogout(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _userAccountsDrawer() {
    return UserAccountsDrawerHeader(
      accountName: const Text("Yönetici"),
      accountEmail: const Text("Yönetici@gmail.com"),
      decoration: BoxDecoration(color: KullaniciColors.purple),
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
            MaterialPageRoute(builder: (context) => const Ygiris()),
            (route) => false);
      },
      leading: Icon(
        Icons.remove_circle,
        color: KullaniciColors.pink,
      ),
    );
  }
}
