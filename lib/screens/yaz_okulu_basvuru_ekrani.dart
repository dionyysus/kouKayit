import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YazOkuluBasvuru extends StatefulWidget {
  const YazOkuluBasvuru({Key? key}) : super(key: key);

  @override
  _YazOkuluBasvuruState createState() => _YazOkuluBasvuruState();
}

class _YazOkuluBasvuruState extends State<YazOkuluBasvuru> {
  @override
  Widget build(BuildContext context) {
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
                  'Yaz Okulu Başvuru Formu',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Teknoloji Fakültesi Bilişim Sistemleri  Bölümü 191307077 numaralı Emre Alkan isimli öğrencisiyim.'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          '20…/20… Eğitim Öğretim yılı yaz öğretimi kapsamında aşağıda bilgilerini verdiğim ders/dersleri almak istiyorum. Kontrol listesinde belirtilen adımları tamamladım.Gereği için arz ederim.'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '                                                                          İmza',
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'E-mail'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Adres'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'GSM'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Danışman Ad-Soyad'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Başvurulan Üniversite'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Yaz Okulu Başlama-Bitiş Tarihleri'),
                ),
              ),
              SizedBox(height: 5,),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text('Kocaeli Üniversitesi Bilişim Sistemleri Mühendisliği Bölümü’nde sorumlu olunan ders/dersler:'),

                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Dersin adı ve kodu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'T                 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'U                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'L                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'AKTS                         ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('A'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('C'),showEditIcon: true),
                        DataCell(Text('D'),showEditIcon: true),
                        DataCell(Text('E'),showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('A'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('C'),showEditIcon: true),
                        DataCell(Text('D'),showEditIcon: true),
                        DataCell(Text('E'),showEditIcon: true,),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('A'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('C'),showEditIcon: true),
                        DataCell(Text('D'),showEditIcon: true),
                        DataCell(Text('E'),showEditIcon: true),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text('Yaz öğretimi kapsamında alınacak ders/dersler'),

                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Dersin adı ve kodu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'T                 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'U                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'L                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'AKTS                         ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('A'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('C'),showEditIcon: true),
                        DataCell(Text('D'),showEditIcon: true),
                        DataCell(Text('E'),showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('A'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('C'),showEditIcon: true),
                        DataCell(Text('D'),showEditIcon: true),
                        DataCell(Text('E'),showEditIcon: true,),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('A'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('C'),showEditIcon: true),
                        DataCell(Text('D'),showEditIcon: true),
                        DataCell(Text('E'),showEditIcon: true),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Dilekçe Ekleri'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          '1-Yaz döneminde ders almak istenilen Üniversite ve Kocaeli Üniversitesinin ilgili bölümlerinin, öğrencinin üniversiteye giriş yılındaki taban puanlarını gösteren belge ektedir'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '2-Alınmak istenilen derslerin karşı Üniversitedeki ders saati/kredi/AKTS ve ders içeriklerini gösteren belge ektedir',
                      ),
                      SizedBox(height: 12,),
                      Text('3-Başvurulan dönem içinde alınmış transkript ektedir          '),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        '         ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Unvan, Adı, Soyadı                 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'İmza                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),


                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Öğrenci Danışmanı     '),showEditIcon: true),
                        DataCell(Text('BBBBBBBBB    '),showEditIcon: true),
                        DataCell(Text('          '),showEditIcon: true),

                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Bölüm Başkanı'),showEditIcon: true),
                        DataCell(Text('B'),showEditIcon: true),
                        DataCell(Text('           '),showEditIcon: true),

                      ],
                    ),



                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'KOCAELİ ÜNİVERSİTESİ YAZ ÖĞRETİMİ ESASLARI'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          'ESAS 1-(1) Spor Bilimleri Fakültesi dışındaki tüm akademik birimlerde okuyan öğrencilerin, diğer yükseköğretim kurumlarından yaz öğretiminde ders alabilmeleri için; Üniversiteye giriş yılı esas olmak üzere ilgili bölüm/program taban puanın en fazla 40 puan düşük olma koşulu aranır'
                              ' (3) Yaz okulunda diğer yükseköğretim kurumlarından alınacak dersler için öğrencinin kayıtlı olduğu ilgili birimin Bölüm/Anabilim Dalı veya Program Başkanlığının onayı gerekir.(4) Yaz okulunda Bölüm/Anabilim Dalı veya Program Başkanlığı bu konudaki değerlendirmesini; ilgili bölüm müfredatındaki benzer içeriğe veya program yeterliliğine sahip olmakla birlikte, ders(ler)in AKTS/kedi/saat değer(ler)inden herhangi birini dikkate alarak yapar'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'ESAS 2- (l) Öğrenciler, yaz öğretiminde derslerin AKTS/kredi/saat değerlerine bakılmaksızın, en çok 3 ders alabilir. ',
                      ),
                      SizedBox(height: 12,),
                      Text('ESAS 3-(l) Güz ve/veya bahar yarıyıllarında kayıt donduran öğrenciler, kayıt dondurdukları yarıyıllara ilişkin dersleri yaz öğretiminde alamazlar          '),
                      Text('ESAS 6- (l)Yaz öğretimi kapsamında alınan ders(ler)in notu genel not ortalamasına bakılmaksızın 4,lük sistem üzerinden 2,nin altında ise öğrenci bu ders(ler)den başarısız sayılır.          '),
                      Text('ESAS 9-  (l) Yaz öğretimi aynı öğretim yılına ait üçüncü bir yarıyıl değildir. Yaz öğretiminde alınan ders(ler)in notları, öğrencilerin güz ve bahar yarıyıllarındaki yarıyıl not ortalamalarını ve yarıyıllardaki derslerin koşul durumlarını etkilemez. Ancak, öğrencinin genel not ortalaması (GNO) hesaplanmasına dahil edilir.          '),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),


              /*DataTable(
                columns: const <DataColumn> [
                  DataColumn(label: Text('E-mail',style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
                rows: const <DataRow> [
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),

                    ],
                  ),
                ],
              )   */
            ],
          ),
        ),
      ),
    );
  }
}
