import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeklemeSayfasi extends StatelessWidget{
  const BeklemeSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: KullaniciColors.pink,
      ),
    );
  }
}