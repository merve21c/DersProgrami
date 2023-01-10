import 'package:dersprogrami/veritaban%C4%B1/EklemeService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Kaynak/Renkler.dart';

class Program extends StatefulWidget {
  const Program({Key? key}) : super(key: key);

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  EkleService _ekleService = EkleService();
  final TextEditingController _adsoyadController = TextEditingController();

  List dropDownListDers = [
    {
      "title": "Nesne Yönelimli Programlama",
      "value": "115  Nesne Yönelimli Programlama"
    },
    {"title": "Programlama Temelleri", "value": " 248 Programlamam Temelleri"},
    {"title": "Mobil Programlama", "value": "256 Mobil Programlama"},
    {"title": "Görsel Programlama", "value": " 369 Görsel Programlama"},
    {"title": "Veri Yapıları", "value": " 299 Veri Yapıları"},
  ];
  List dropDownListUnvan = [
    {"title": "Öğretim Üyesi", "value": "Öğretim Üyesi"},
    {"title": "Dr. Öğretim Üyesi", "value": "Dr.Öğretim Üyesi"},
    {"title": "Araştırma Görevlisi", "value": "Araştırma Görevli"},
    {"title": "Profesör", "value": "Profesör"},
    {"title": "Doçent", "value": "Doçent"},
  ];

  List dropDownListLab = [
    {"title": "Lab-1", "value": "Lab-1"},
    {"title": "Lab-2", "value": "Lab-2"},
    {"title": "Lab-3", "value": "Lab-3"},
    {"title": "Lab-4", "value": "Lab-4"},
    {"title": "Lab-5", "value": "Lab-5"},
  ];


  List dropDownListSaat = [
    {"title": "9.00-9.45", "value": "9.00-9.45"},
    {"title": "9.55-10.40", "value": "9.55-10.40"},
    {"title": "10.50-11.35", "value": "10.50-11.35"},
    {"title": "11.45-12.30", "value": "11.45-12.30"},
    {"title": "13.30-14.15", "value": "13.30-14.15"},
    {"title": "14.25-15.10", "value": "14.25-15.10"},
    {"title": "14.25-15.10", "value": "14.25-15.10"},
  ];

  List dropDownListSube = [
    {"title": "A şubesi", "value": "A Şubesi"},
    {"title": "B şubesi", "value": "B Şubesi"},

  ];
  List dropDownListGun = [
    {"title": "Pazartesi", "value": "Pazartesi"},
    {"title": "Sali", "value": "Salı"},
    {"title": "Carsamba", "value": "Çarşamba"},
    {"title": "Persembe", "value": "Perşembe"},
    {"title": "Cuma", "value": "Cuma"},

  ];

  String dropdownunvanValue = "";
  String DersValue = ""; //ders
  String DropDownLabValue = ""; //lab
  String dropdownSaatValue = "";
  String dropdownSube="";
  String dropdownGun="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Program"),
        backgroundColor: KullaniciColors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
              controller: _adsoyadController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: KullaniciColors.purple),
                ),
                labelText: 'Ad Soyad',
                hintText: 'Ad Soyad',
                prefixIcon: Icon(
                  Icons.person,
                  color: KullaniciColors.grey,
                ),
                labelStyle: TextStyle(color: KullaniciColors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(10),
              )),
          SizedBox(height: 20.0),
          InputDecorator(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: dropdownunvanValue,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Ünvan Seçiniz",
                        ),
                        value: ""),
                    ...dropDownListUnvan.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (title) {
                    setState(() {
                      dropdownunvanValue = title ?? dropdownunvanValue;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: DersValue,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Ders Seçiniz",
                        ),
                        value: ""),
                    ...dropDownListDers.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (title) {
                    setState(() {
                      DersValue = title ?? DersValue;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: DropDownLabValue,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Lab Seçiniz",
                        ),
                        value: ""),
                    ...dropDownListLab.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (title) {
                    setState(() {
                      DropDownLabValue = title ?? DropDownLabValue;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: dropdownSaatValue,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Saat Seçiniz",
                        ),
                        value: ""),
                    ...dropDownListSaat.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (title) {
                    setState(() {
                      dropdownSaatValue = title ?? dropdownSaatValue;
                    });
                  }),
            ),
          ),


          const SizedBox(
            height: 20,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: dropdownSube,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Şube Seçiniz",
                        ),
                        value: ""),
                    ...dropDownListSube.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (title) {
                    setState(() {
                      dropdownSube = title ?? dropdownSube;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: dropdownGun,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Gun Seçiniz",
                        ),
                        value: ""),
                    ...dropDownListGun.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (title) {
                    setState(() {
                      dropdownGun = title ?? dropdownGun;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _ekleService.addProgram(
                    _adsoyadController.text,
                    dropdownunvanValue,
                    DersValue,
                    DropDownLabValue,
                    dropdownSaatValue,
                    dropdownSube,
                  dropdownGun
                );

                Fluttertoast.showToast(
                    msg: " Bilgiler eklendi!",
                    timeInSecForIosWeb: 5,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey[600],
                    textColor: Colors.white,
                    fontSize: 14);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: KullaniciColors.pink),
              child: const Text("Ekle")),
        ]),
      ),
    );
  }
}
