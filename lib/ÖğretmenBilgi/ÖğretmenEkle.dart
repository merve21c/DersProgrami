import 'package:flutter/material.dart';

class OgretmenEkle extends StatefulWidget {
  OgretmenEkle({Key? key}) : super(key: key);

  @override
  _OgretmenEkleState createState() => _OgretmenEkleState();
}

class _OgretmenEkleState extends State<OgretmenEkle> {
  final _formKey = GlobalKey<FormState>();

  var OgretmenUnvan = "";
  var OgretmenAdi= "";
  var GirdigiDersler = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final UnvanController= TextEditingController();
  final  AdiController= TextEditingController();
  final DersController= TextEditingController();

  @override
  void dispose() {

    UnvanController.dispose();
    AdiController.dispose();
    DersController.dispose();
    super.dispose();
  }

  clearText() {
    UnvanController.clear();
    AdiController.clear();
    DersController.clear();
  }

  // Adding Student
  CollectionReference Ogretmen =
  FirebaseFirestore.instance.collection('ögretmen');

  Future<void> ekle() {
    return Ogretmen
        .add({'Ünvan': OgretmenUnvan, 'Adi': OgretmenAdi, 'Girdigi dersler': GirdigiDersler})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("öğretmen ekle"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Ünvan: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: UnvanController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ünvan bilgisini girin';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Adi: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: AdiController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'lütfen adınızı giriniz';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,

                  decoration: InputDecoration(
                    labelText: 'Girdigi ders: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: DersController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'dersinizi giriniz';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            OgretmenUnvan= UnvanController.text;
                           OgretmenAdi = AdiController.text;
                            GirdigiDersler = DersController.text;
                            ekle();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Kaydet',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Sıfırla',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}