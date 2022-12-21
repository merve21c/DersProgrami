import 'package:dersprogrami/ogretmenlerK.dart';
import 'package:dersprogrami/servisler/OgK_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OgK extends StatefulWidget {
  const OgK({Key? key, required String gun, required String ders, required String Oadi}) : super(key: key);

  @override
  State<OgK> createState() => _OgKState();
}

class _OgKState extends State<OgK> {
  final TextEditingController _OadController =TextEditingController();
  final TextEditingController _gunController = TextEditingController();
  final TextEditingController _dersController = TextEditingController();
   String gelenAd="";
  var gelengun="";
  var gelenDersad="";
  OgKService _ogKService = OgKService();
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders ve Günler"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * .4,
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
                        controller: _OadController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Öğretmen Adı",
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
                          hintText: "Müsait Günler",
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
                        controller: _dersController,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                      child: InkWell(
                        onTap: () {
                        _ogKService
                              .addOgK(_OadController.text,_gunController.text , _dersController.text ,'')
                              .then((value) {
                                setState(() {
                                });
                            Fluttertoast.showToast(
                                msg: "Eklendi!",
                                timeInSecForIosWeb: 5,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey[600],
                                textColor: Colors.white,
                                fontSize: 14);
                            Navigator.push(context,MaterialPageRoute(builder: (context)  =>ogretmenlerK()));
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
    );
  }
}