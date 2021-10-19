import 'dart:math';

import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/secim_ekrani.dart';
import 'package:basvurukayit/service/yatay_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';

class YatayGecisBasvuru extends StatefulWidget {
  const YatayGecisBasvuru({Key? key}) : super(key: key);

  @override
  _YatayGecisBasvuruState createState() => _YatayGecisBasvuruState();
}

class _YatayGecisBasvuruState extends State<YatayGecisBasvuru> {
  TextEditingController  _notOrtcontroller = TextEditingController();
  TextEditingController _yerlesmeYiliController = TextEditingController();
  TextEditingController  _puanController= TextEditingController();
  TextEditingController _yabanciDilController = TextEditingController();
  TextEditingController _basvurulanFakulteController = TextEditingController();
  TextEditingController _basvurulanBolumController = TextEditingController();
  TextEditingController _basvurulanProgramYilPuanController = TextEditingController();

  String basvuruDurum = "";
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DateTime currentTime = DateTime.now();

  YatayBasvuruService _yatayBasvuruService = YatayBasvuruService();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  List<String> _checkedBasvuruTuru = [];
  List<String> _checkedOgretimTuru = [];
  List<String> _checkedSinifTuru = [];
  List<String> _checkedDisiplin = [];
  List<String> _checkedOnay = [];
  String secilenHolderBasvuru = " ";
  String secilenHolderOgretim = "";
  String secilenHolderSinif = "";
  String secilenHolderDisiplin = "";
  String secilenHolderOnay = "";

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    final String formattedDate = dateFormat.format(currentTime).toString();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 150.0,
                width: 120.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  '       KOCAELİ ÜNİVERSİTESİ\nYATAY GEÇİŞ BAŞVURU FORMU',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    '1-Başvuru Türü',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  CheckboxGroup(
                    labels: <String>[
                      "KURUM İÇİ YATAY GEÇİŞ",
                      "KURUMLAR ARASI YATAY GEÇİŞ",
                      "MER. YER. PUANIYLA YATAY GEÇİŞ",
                      "YURT DIŞI YATAY GEÇİŞ BAŞVURUSU"
                    ],
                    checked: _checkedBasvuruTuru,
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> selectedBasvuru) => setState(() {
                      if (selectedBasvuru.length > 1) {
                        selectedBasvuru.removeAt(0);
                        print('selected length  ${selectedBasvuru.length}');
                        print('selected value : ${selectedBasvuru.toString()}');
                        secilenHolderBasvuru = selectedBasvuru.join("");
                        print("değerrrrrr" + secilenHolderBasvuru);
                      } else {
                        print("only one");
                        print('selected value : ${selectedBasvuru.toString()}');
                        secilenHolderBasvuru = selectedBasvuru.join("");
                        print("değerrrrrr" + secilenHolderBasvuru);
                      }
                      _checkedBasvuruTuru = selectedBasvuru;
                    }),
                  ),
                  /*   ...checkBoxList
                      .map((item) => ListTile(
                            onTap: () => onItemClicked(item),
                            leading: Checkbox(
                              value: item.value,
                              onChanged: (value) => onItemClicked(item),
                            ),
                            title: Text(item.title),
                          ))
                      .toList()  */
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                '2-Kişisel Bilgiler',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.userName!.toUpperCase()}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.tcId}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.dogumTarihi}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.email}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.gsm}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.evAdres}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                '3-Öğrenimine ilişkin bilgiler',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.universite}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.fakulte}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.bolum}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Öğrenim Türü',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  CheckboxGroup(
                    labels: <String>[
                      "1.Öğretim",
                      "2.Öğretim",
                    ],
                    checked: _checkedOgretimTuru,
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> selectedOgretim) => setState(() {
                      if (selectedOgretim.length > 1) {
                        selectedOgretim.removeAt(0);
                        print('selected length  ${selectedOgretim.length}');
                        print('selected value : ${selectedOgretim.toString()}');
                        secilenHolderOgretim = selectedOgretim.join("");
                        print("değerrrrrr" + secilenHolderOgretim);
                      } else {
                        print("only one");
                        print('selected value : ${selectedOgretim.toString()}');
                        secilenHolderOgretim = selectedOgretim.join("");
                        print("değerrrrrr" + secilenHolderOgretim);
                      }
                      _checkedOgretimTuru = selectedOgretim;
                    }),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Sınıfı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  CheckboxGroup(
                    labels: <String>[
                      "1",
                      "2",
                      "3",
                      "4",
                      "5 ve Üzeri",
                    ],
                    checked: _checkedSinifTuru,
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> selectedSinif) => setState(() {
                      if (selectedSinif.length > 1) {
                        selectedSinif.removeAt(0);
                        print('selected length  ${selectedSinif.length}');
                        print('selected value : ${selectedSinif.toString()}');
                        secilenHolderSinif = selectedSinif.join("");
                        print("değerrrrrr" + secilenHolderSinif);
                      } else {
                        print("only one");
                        print('selected value : ${selectedSinif.toString()}');
                        secilenHolderSinif = selectedSinif.join("");
                        print("değerrrrrr" + secilenHolderSinif);
                      }
                      _checkedSinifTuru = selectedSinif;
                    }),
                  ),
                ],
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Disiplin Cezası',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  CheckboxGroup(
                    labels: <String>[
                      "VAR",
                      "YOK",
                    ],
                    checked: _checkedDisiplin,
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> selectedDisiplin) => setState(() {
                      if (selectedDisiplin.length > 1) {
                        selectedDisiplin.removeAt(0);
                        print('selected length  ${selectedDisiplin.length}');
                        print('selected value : ${selectedDisiplin.toString()}');
                        secilenHolderDisiplin = selectedDisiplin.join("");
                        print("değerrrrrr" + secilenHolderDisiplin);
                      } else {
                        print("only one");
                        print('selected value : ${selectedDisiplin.toString()}');
                        secilenHolderDisiplin = selectedDisiplin.join("");
                        print("değerrrrrr" + secilenHolderDisiplin);
                      }
                      _checkedDisiplin = selectedDisiplin;
                    }),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'GENEL NOT ORTALAMASI'),
                  controller: _notOrtcontroller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.ogrenciNo}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'KAYITLI ÜNİVERSİTEYE YERLEŞME YILI'),
                  controller: _yerlesmeYiliController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'YERLEŞİLEN PUAN TÜRÜ VE PUANI'),
                  controller: _puanController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'YABANCI DİL PUANI VE TÜRÜ'),
                  controller: _yabanciDilController,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                '4-ADAYIN BAŞVURDUĞU YÜKSEKÖĞRETİM PROGRAMINA İLİŞKİN BİLGİLER',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'FAKÜLTE / YÜKSEKOKUL/MYO.  ADI'),
                  controller: _basvurulanFakulteController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'BÖLÜM/PROGRAM ADI'),
                  controller: _basvurulanBolumController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'BAŞVURULAN PROGRAMIN YERLEŞİLEN YILA AİT PUANI'),
                  controller: _basvurulanProgramYilPuanController,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Beyan ettiğim bilgilerin veya belgelerin gerçeğe aykırı olması veya daha önce yatay geçiş yapmış olmam halinde hakkımda cezai işlemlerin yürütüleceğini ve kaydım yapılmış olsa dahi silineceğini bildiğimi kabul ediyorum.'),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(' Tarih : ${formattedDate.toString()}'),
                          SizedBox(
                            width: 140,
                          ),
                          Column(
                            children: [
                              Text(
                                ' Ad-Soyad',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('${loggedInUser.userName!.toUpperCase()}'),
                              SizedBox(
                                height: 14,
                              ),
                              Text('imza')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                'BU BÖLÜM ÜNİVERSİTE YETKİLİ BİRİMLERİNCE DOLDURULACAKTIR',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  CheckboxGroup(
                    labels: <String>[
                      "BAŞVURUSU UYGUNDUR",
                      "BAŞVURUSU UYGUN DEĞİLDİR",
                    ],
                    checked: _checkedOnay,
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> selectedOnay) => setState(() {
                      if (selectedOnay.length > 1) {
                        selectedOnay.removeAt(0);
                        print('selected length  ${selectedOnay.length}');
                        print('selected value : ${selectedOnay.toString()}');
                        secilenHolderOnay = selectedOnay.join("");
                        print("değerrrrrr" + secilenHolderOnay);
                      } else {
                        print("only one");
                        print('selected value : ${selectedOnay.toString()}');
                        secilenHolderOnay = selectedOnay.join("");
                        print("değerrrrrr" + secilenHolderOnay);
                      }
                      _checkedOnay = selectedOnay;
                    }),
                  ),
                ],
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Varsa açıklamalar : .....................................'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        ' Tarih : ..../.../.....                           ',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          ' Başvuruyu alan görevlinin                                 Ad-Soyad İmza')
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(padding: const EdgeInsets.only(left: 8,right: 8,bottom: 25),
              child: InkWell(
                onTap: (){
                  _yatayBasvuruService.basvuruOlustur(secilenHolderBasvuru, loggedInUser.userName, loggedInUser.tcId, loggedInUser.dogumTarihi, loggedInUser.email, loggedInUser.gsm, loggedInUser.evAdres, loggedInUser.fakulte, loggedInUser.bolum, secilenHolderOgretim, secilenHolderSinif, secilenHolderDisiplin, _notOrtcontroller.text, loggedInUser.ogrenciNo, _yerlesmeYiliController.text, _puanController.text, _yabanciDilController.text, _basvurulanFakulteController.text, _basvurulanBolumController.text, _basvurulanProgramYilPuanController.text ,basvuruDurum);
                  showDialog(context: context, builder: (_)=>AlertDialog(
                    title: Text('Başvuru onayınız alındı'),
                    content: Text('Kontroller ardından onay/ret işlemi gerçekleştirilecektir'),
                  )).then((value) =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SecimEkrani())));

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text("Başvuruyu Onayla",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ),
              )

                )
            ],
          ),
        ),
      ),
    );
  }
}
