import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/servisler/bilgisayardersP_service.dart';
import 'package:flutter/material.dart';

class BilgisayarPlist extends StatefulWidget {
  const BilgisayarPlist({Key? key}) : super(key: key);

  @override
  State<BilgisayarPlist> createState() => _BilgisayarPlistState();
}

class _BilgisayarPlistState extends State<BilgisayarPlist> {
  BilgisayarService _bilgisayarService=BilgisayarService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _bilgisayarService.getBilgisayarDersPekle(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot mypost = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * .4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${mypost['bolumadiID']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${mypost['gun']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${mypost['dersadi']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${mypost['dersOgretmeni']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${mypost['dersSaati']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${mypost['lab']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
              );
              },
        );
      },
    );
  }
}
