import 'package:dersprogrami/servisler/Dekle_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dekle extends StatefulWidget {
  const Dekle({Key? key}) : super(key: key);

  @override
  State<Dekle> createState() => _DekleState();
}

class _DekleState extends State<Dekle> {
  final TextEditingController _dersIdController = TextEditingController();
  final TextEditingController _dersadiController = TextEditingController();
  final TextEditingController _dersSaatiController = TextEditingController();
       DekleService _dekleService = DekleService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Bilgileri"),
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
                        controller: _dersIdController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Ders Id",
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
                        controller: _dersSaatiController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Ders Saati",
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
                          _dekleService
                              .addDekle(_dersIdController.text , _dersadiController.text , _dersSaatiController.text ,'')
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Ders Bilgileri eklendi!",
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
    );
  }
}