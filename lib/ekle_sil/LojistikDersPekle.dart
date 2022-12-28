import 'package:dersprogrami/servisler/Lojistik_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LojistikDersPekle extends StatefulWidget {
  const LojistikDersPekle({Key? key}) : super(key: key);

  @override
  State<LojistikDersPekle> createState() => _LojistikDersPekleState();
}

class _LojistikDersPekleState extends State<LojistikDersPekle> {
  final TextEditingController _bolumadiIDController = TextEditingController();
  final TextEditingController _gunController = TextEditingController();
  final TextEditingController _dersadiController = TextEditingController();
  final TextEditingController _dersOgretmeniController =TextEditingController();
  final TextEditingController _dersSaatiController = TextEditingController();
  final TextEditingController _amfiController = TextEditingController();
  LojistikService _lojistikService=LojistikService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Programı Ekle"),
      ),
      body:SingleChildScrollView(     //kaydırma çubuğu
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * .6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                          controller: _bolumadiIDController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Bölüm Adı ve Id",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                      TextField(
                          controller: _gunController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Gün",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                      TextField(
                          controller: _dersadiController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Ders Adı",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                      TextField(
                          controller: _dersOgretmeniController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Ders Öğretmeni",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                      TextField(
                          controller: _dersSaatiController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: " Ders Saati",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                        child: InkWell(
                          onTap: () {
                            _lojistikService
                                .addLojistikDersPekle(_bolumadiIDController.text ,_gunController.text,_dersadiController.text,_dersOgretmeniController.text,_dersSaatiController.text,_amfiController.text,'')
                                .then((value) {
                              Fluttertoast.showToast(
                                  msg: "Ders Programı eklendi!",
                                  timeInSecForIosWeb: 5,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.grey[600],
                                  textColor: Colors.white,
                                  fontSize: 14);
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2),
                                //color: colorPrimaryShade,
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                    "Ekle",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],




                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
