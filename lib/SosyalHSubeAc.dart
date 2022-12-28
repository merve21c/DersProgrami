import 'package:dersprogrami/servisler/SosyalHSube_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SosyalHSubeAc extends StatefulWidget {
  const SosyalHSubeAc({Key? key}) : super(key: key);

  @override
  State<SosyalHSubeAc> createState() => _SosyalHSubeAcState();
}

class _SosyalHSubeAcState extends State<SosyalHSubeAc> {
  TextEditingController _subeController =TextEditingController();
  SosyalHSubeService _sosyalHSubeService=SosyalHSubeService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text("Şube"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * .3,
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
                        controller: _subeController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Sube",
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
                          _sosyalHSubeService
                              .addSosyalHSubeAc(_subeController.text,'')
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Sube eklendi!",
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
