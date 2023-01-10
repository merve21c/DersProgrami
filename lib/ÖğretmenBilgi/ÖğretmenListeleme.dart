import 'package:dersprogrami/%C3%96%C4%9FretmenBilgi/%C3%96%C4%9FretmenG%C3%BCncelle.dart';
import 'package:flutter/material.dart';

class OgretmenListeleme extends StatefulWidget {
  const OgretmenListeleme({Key? key}) : super(key: key);

  @override

  _OgretmenListelemeState createState() => _OgretmenListelemeState();
}

class _OgretmenListelemeState extends State<OgretmenListeleme> {
  final Stream<QuerySnapshot> OgretmenStream =
  FirebaseFirestore.instance.collection('öğretmen').snapshots();

  // For Deleting User
  CollectionReference Ogretmen =
  FirebaseFirestore.instance.collection('öğretmen');
  Future<void> deleteogr(id) {

    return Ogretmen
        .doc(id)
        .delete()

        .then((value) => print('öğretmen sil'))

        .catchError((error) => print('silmede hata oluştu!: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: OgretmenStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];   //datayı çağırdı
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin:  EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            child:SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: <int, TableColumnWidth>{
                  1: FixedColumnWidth(60),
                },

                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [

                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child:  Center(
                            child: Text(
                              'Ünvanı',

                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Adı',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(

                        child: Container(
                          color: Colors.greenAccent,
                          child:  Center(
                            child: Text(
                              'Girdiği Ders',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child:  Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['Ünvanı'],
                                  style:  TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['Adı'],
                                  style:  TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['Girdiği Ders'],
                                  style: TextStyle(fontSize: 18.0))),
                        ),


                        TableCell(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OgretmenGuncelle(
                                          id: storedocs[i]['id']),
                                    ),
                                  )
                                },
                                icon:  Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                {deleteogr(storedocs[i]['id'])},
                                icon:  Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}