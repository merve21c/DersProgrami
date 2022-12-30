import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:flutter/material.dart';

class RenkAppBar extends AppBar{
  RenkAppBar(
      String title, {
        Key? key,
      }) : super(
    key: key,
    backgroundColor:KullaniciColors.purple ,
    title: Text(
      title,
    ),
    elevation: 0.0,
  );
}