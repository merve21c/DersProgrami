import 'package:dersprogrami/%C3%B6%C4%9Fretmenler.dart';
import 'package:dersprogrami/ogretmenlerK.dart';
import 'package:dersprogrami/servisler/Oekle_service.dart';
import 'package:flutter/material.dart';


class Oekle extends StatefulWidget {
  const Oekle({Key? key}) : super(key: key);

  @override
  State<Oekle> createState() => _OekleState();
}

class _OekleState extends State<Oekle> {
  final TextEditingController _adisoyadiController = TextEditingController();
  final TextEditingController _unvanController = TextEditingController();
  final TextEditingController _dersController = TextEditingController();


 OekleService _oekleService = OekleService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: size.height * .7,
                  width: size.width * .85,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.75),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.75),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: ' Adı soyadı',
                                prefixText: ' ',
                                hintStyle: TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                              )),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Unvan',
                                prefixText: ' ',
                                hintStyle: TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                              )),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: 'Ders',
                                prefixText: ' ',
                                hintStyle: TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                              )),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              _oekleService.addOekle(_adisoyadiController.text, _unvanController.text, _dersController.text)
                                  .then((value) {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>ogretmenler()
                              )
                              );
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  //color: colorPrimaryShade,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                    child: Text(
                                      "Ekle",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: size.height * .06, left: size.width * .02),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.blueAccent.withOpacity(.75),
                        size: 26,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                    ),
                    Text(
                      "Ekle",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent.withOpacity(.75),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
