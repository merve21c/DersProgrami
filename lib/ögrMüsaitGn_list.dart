import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dersprogrami/servisler/OgK_service.dart';
import 'package:flutter/material.dart';

class ogrMusaitGunlist extends StatefulWidget {
  const ogrMusaitGunlist({Key? key}) : super(key: key);

  @override
  State<ogrMusaitGunlist> createState() => _ogrMusaitGunlistState();
}

class _ogrMusaitGunlistState extends State<ogrMusaitGunlist> {
  OgKService _ogKService=OgKService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _ogKService.getOgK(),
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
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${mypost['Oadi']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${mypost['gun']}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${mypost['ders']}",
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
            });
      },
    );  }
}
