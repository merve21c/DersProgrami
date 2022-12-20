import 'package:dersprogrami/servisler/Labekle_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Labekle extends StatefulWidget {
  const Labekle({Key? key}) : super(key: key);

  @override
  State<Labekle> createState() => _LabekleState();
}

class _LabekleState extends State<Labekle> {
  final TextEditingController _laboratuvarController = TextEditingController();
     LabekleService _labekleService = LabekleService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Laboratuvar"),
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
                        controller: _laboratuvarController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Laboratuvar",
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
                          _labekleService
                              .addLabekle(_laboratuvarController.text,'')
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Laboratuvar eklendi!",
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