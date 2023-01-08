import 'package:dersprogrami/Kaynak/Renkler.dart';
import 'package:flutter/material.dart';

class DropDownHelper extends StatefulWidget {
  const DropDownHelper({Key? key}) : super(key: key);

  @override
  State<DropDownHelper> createState() => _DropDownHelperState();
}

class _DropDownHelperState extends State<DropDownHelper> {
  List dropDownListDers = [
    {"title": "Nesne Yönelimli Programlama", "value": "1"},
    {"title": "Programlama Temelleri", "value": "2"},
    {"title": "Mobil Programlama", "value": "3"},
    {"title": "Görsel Programlama", "value": "4"},
    {"title": "Veri Yapıları", "value": "5"},
  ];

  List dropDownListDerslik = [
    {"title": "Lab-1", "value": "1"},
    {"title": "Lab-2", "value": "2"},
    {"title": "Lab-3", "value": "3"},
    {"title": "Lab-4", "value": "4"},
    {"title": "Lab-5", "value": "5"},
  ];

  String defaultValue = "";  //değer
  String secondDropDown = ""; //ilk dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:KullaniciColors.purple),
                ),
                labelText: 'Ad Soyad',
                hintText: 'Ad Soyad',
                prefixIcon: Icon(
                  Icons.person,
                  color: KullaniciColors.grey,
                ),
                labelStyle: TextStyle(color: KullaniciColors.black),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                  value: defaultValue, //dersler
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Nesne Yönelimli Programlama",
                        ),
                        value: ""),
                    ...dropDownListDers.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (value) {
                    setState(() {
                      defaultValue = value!;
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
                  value: secondDropDown, //lablar
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Lab-1",
                        ),
                        value: ""),
                    ...dropDownListDerslik.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']); //uzunluğu kadar
                    }).toList(),
                  ],
                  onChanged: (value) {
                    setState(() {
                      secondDropDown = value!;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {

              },
              child: const Text("Ekle")),
          ElevatedButton(
              onPressed: () {

              },
              child: const Text("Geri Dön"))
        ]),
      ),
    );
  }
}